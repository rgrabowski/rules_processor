RSpec.describe RulesProcessor::ConditionMatcher do
  describe '#normalized_value' do
    let(:condition) { {field: 'ticket_subject', operator: 'include', value: [1, 2]} }
    let(:ticket) { double('ticket', subject: 1) }

    subject { described_class.new(condition: condition, records: {ticket: ticket}) }

    it 'raise error' do
      expect { subject.matches? }.to raise_error(RuntimeError, 'Not supported comparison for Fixnum')
    end
  end
end