require 'spec_helper'

describe Tp::Subscriptions::Invoices::Failings::Dripper do
  describe '#start' do
    let(:notifier) { double(Tp::Subscriptions::Invoices::Failings::Notifier) }
    let(:invoice) { OpenStruct.new(id: 1) }
    subject { described_class.new(invoice) }

    before do
      @resque_inline = Resque.inline
      Resque.inline = true
    end

    after do
      Resque.inline = @resque_inline
    end

    it 'notify with drip count is 0' do
      allow(Tp::Subscriptions::Invoices::Failings::Notifier).to receive(:new).with(invoice).and_return(notifier)
      expect(notifier).to receive(:drip_notify).with(0)
      expect(Resque).to receive(:enqueue_at).with(DateTime.parse('Tue, 24 Jan 2017 10:00:00 +0000'),
                                                  Tp::Subscriptions::Invoices::Failings::Dripper::DripWorker,
                                                  "Tp::Subscriptions::Invoices::Failings::Dripper",
                                                  invoice.id,
                                                  1)

      subject.start
    end

    it 'notify with drip count is 0' do
      allow(Tp::Subscriptions::Invoices::Failings::Notifier).to receive(:new).with(invoice).and_return(notifier)
      expect(notifier).to receive(:drip_notify).with(0)
      expect(Resque).to receive(:enqueue_at).with(DateTime.parse('Tue, 24 Jan 2017 10:00:00 +0000'),
                                                  Tp::Subscriptions::Invoices::Failings::Dripper::DripWorker,
                                                  "Tp::Subscriptions::Invoices::Failings::Dripper",
                                                  invoice.id,
                                                  1)

      subject.start_inline
    end
  end
end
