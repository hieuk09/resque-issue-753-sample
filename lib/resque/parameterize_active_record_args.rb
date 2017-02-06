require 'resque'

module Resque
  # This module will automatically turn any ActiveRecord arguments
  # passed to enqueue/enqueue_at into their corresponding id.
  #
  # This allows Resque to take models as arguments, but deserialize
  # them intelligently as well.
  module ParameterizeActiveRecordArgs
    def self.extended(base)
      base.class_eval do
        class << self
          alias_method_chain :enqueue, :active_record_args
          alias_method_chain :enqueue_at, :active_record_args
        end
      end
    end

    def enqueue_with_active_record_args(klass, *args)
      parameterize_active_record_args!(args)
      enqueue_without_active_record_args(klass, *args)
    end

    def enqueue_at_with_active_record_args(time_at, klass, *args)
      parameterize_active_record_args!(args)
      enqueue_at_without_active_record_args(time_at, klass, *args)
    end

    def parameterize_active_record_args!(args)
      args.map! do |arg|
        if arg.kind_of?(Array)
          arg.map { |arg_el| parameterize_active_record_arg(arg_el) }
        else
          parameterize_active_record_arg(arg)
        end
      end
      args
    end
    module_function :parameterize_active_record_args!

    private

    def parameterize_active_record_arg(arg)
      if arg.kind_of?(ActiveRecord::Base)
        arg.id
      else
        arg
      end
    end
    module_function :parameterize_active_record_arg
  end
end
