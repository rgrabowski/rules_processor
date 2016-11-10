RSpec.describe RulesProcessor::Operations::Base do
  describe '#perform' do
    let(:condition) { {field: 'ticket_subject', operator: 'include', value: [1, 2]} }
    let(:ticket) { double('ticket', subject: 1) }

    subject { described_class.new(condition: condition, records: {ticket: ticket}) }

    it 'raise error' do
      expect { subject.perform }.to raise_error(NotImplementedError)
    end
  end
end