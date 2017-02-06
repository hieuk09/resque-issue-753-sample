module Tp::Subscriptions::Invoices::Failings
  class Dripper
    class DripWorker
      @queue = :subscriptions_invoices_failings_dripper_worker

      def self.perform(class_name, invoice_id, drip_count)
        invoice = OpenStruct.new(id: 1)
        Dripper.new(invoice).drip(drip_count)
      end
    end

    DRIP_SCHEDULE = [7.days]

    def initialize(invoice)
      @invoice = invoice
    end

    def start
      Resque.enqueue(DripWorker, self.class.name, @invoice.id, 0)
    end

    def start_inline
      DripWorker.perform(self.class.name, @invoice.id, 0)
    end

    def stop
      Resque.remove_delayed_selection do|args|
        args[0] == self.class.name && args[1] == @invoice.id
      end
    end

    def drip(drip_count)
      if closed?
        stop
        return
      end

      Notifier.new(@invoice).drip_notify(drip_count)
      if next_attempt_at(drip_count)
        Resque.enqueue_at(next_attempt_at(drip_count),
          DripWorker, self.class.name, @invoice.id, drip_count + 1)
      end
    end

    private

    def closed?
      false
    end

    def next_attempt_at(drip_count)
      DateTime.parse('Tue, 24 Jan 2017 10:00:00 +0000')
    end
  end
end
