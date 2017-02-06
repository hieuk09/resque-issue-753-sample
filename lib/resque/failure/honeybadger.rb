# https://gist.github.com/3254712

require 'resque'
require 'honeybadger'

module Resque
  module Failure
    class Honeybadger < Base
      def self.configure
        Resque::Failure.backend = self
      end

      def self.count
        # We can't get the total # of errors from Honeybadger so we
        # fake it by asking Resque how many errors it has seen.
        Stat[:failed]
      end

      def save
        ::Honeybadger.notify_or_ignore(exception,
          parameters: {
            :payload_class => payload['class'].to_s,
            :payload_args =>  payload['args'].inspect
          }
        )
      end
    end
  end
end
