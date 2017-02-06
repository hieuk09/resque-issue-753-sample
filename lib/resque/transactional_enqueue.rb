require 'ar_after_transaction'
require 'resque'

module Resque
  # This module enqueues that we only enqueue Resque jobs after
  # a transaction successfully executes.
  #
  # This way, we don't run into race conditions between the DB updating
  # and Resque processing a job.
  module TransactionalEnqueue
    def self.extended(base)
      base.class_eval do
        class << self
          alias_method_chain :enqueue, :after_transaction
        end
      end
    end

    def enqueue_with_after_transaction(*args)
      ActiveRecord::Base.after_transaction do
        enqueue_without_after_transaction(*args)
      end
    end
  end
end
