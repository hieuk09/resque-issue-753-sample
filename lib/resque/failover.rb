# -*- encoding : utf-8 -*-
module Resque
  # Provides a Failover to MySQL.
  module Failover
    def self.extended(base)
      base.class_eval do
        class << self
          alias_method_chain :enqueue, :active_record_failover
          alias_method_chain :enqueue_at, :active_record_failover
        end
      end
    end

    @@enqueue_exceptions = [
      Redis::CannotConnectError,
      Redis::TimeoutError,
      Redis::CommandError,
    ]

    def enqueue_with_active_record_failover(klass, *args)
      begin
        enqueue_without_active_record_failover(klass, *args)
      rescue *@@enqueue_exceptions => exception
        recover_enqueue_failure(klass, nil, exception, *args)
      end
    end

    def enqueue_at_with_active_record_failover(enqueue_at, klass, *args)
      begin
        enqueue_at_without_active_record_failover(enqueue_at, klass, *args)
      rescue *@@enqueue_exceptions => exception
        recover_enqueue_failure(klass, enqueue_at, exception, *args)
      end
    end

  private

    class FailedResqueJobError < RuntimeError
      attr_reader :exception, :resque_job

      def initialize(exception, resque_job)
        @exception = exception
        @resque_job = resque_job
      end

      def to_s
        "There are #{ResqueJob.count} failed Resque jobs.\n"\
          "Latest exception: #{exception.inspect}\n"\
          "Latest failed job: #{resque_job.inspect}"
      end
    end

    def recover_enqueue_failure(klass, enqueue_at, exception, *args)
      resque_job = ResqueJob.create(
        :klass_name => klass.to_s,
        :enqueue_at => enqueue_at,
        :args_json => args.to_json
      )

      Tp::ErrorNotifier.notify(FailedResqueJobError.new(exception, resque_job))
    end
  end
end
