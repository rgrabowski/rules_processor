RSpec.describe RulesProcessor::ConditionMatcher do

  describe '#matches?' do
    subject { described_class.new(condition: condition, records: {ticket: ticket}) }

    context 'when greater than' do
      let(:condition) { {field: 'ticket_replies', operator: 'greater_than', value: '3'} }
      let(:ticket) { double('ticket', replies: 5) }

      it 'returns true' do
        expect(subject.matches?).to be(true)
      end
    end
  end

end