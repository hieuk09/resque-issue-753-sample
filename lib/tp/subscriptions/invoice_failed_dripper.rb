# Deprecated
module Tp
  module Subscriptions
    class InvoiceFailedDripper
      def self.start(invoice)
        Resque.
          enqueue(
            InvoiceFailedDripWorker,
            invoice.id,
            1
          )
      end

      def self.stop(invoice)
      end

      def self.perform_attempt(invoice, attempt)
        case attempt
        when 1
          UserMailer.invoice_payment_failed(invoice, 1).deliver
        end
      end
    end
  end
end
