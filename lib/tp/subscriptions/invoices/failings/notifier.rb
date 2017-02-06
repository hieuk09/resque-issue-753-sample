module Tp::Subscriptions::Invoices::Failings
  class Notifier
    def initialize(invoice)
      @invoice = invoice
    end

    def attempt_failed(attempt_count)
      if attempt_count == 1
        Dripper.new(@invoice).start
      end
      EmailNotification.notify_admin(@invoice).deliver
    end

    def drip_notify(drip_count)
      EmailNotification.notify_owner(@invoice, drip_count).deliver
    end

    def clear
      Dripper.new(@invoice).stop
    end
  end
end
