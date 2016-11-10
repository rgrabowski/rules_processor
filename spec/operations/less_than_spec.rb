RSpec.describe RulesProcessor::ConditionMatcher do

  describe '#matches?' do
    subject { described_class.new(condition: condition, records: {ticket: ticket}) }

    context 'when less than' do
      let(:condition) { {field: 'ticket_replies', operator: 'less_than', value: '7'} }
      let(:ticket) { double('ticket', replies: 5) }

      it 'returns true' do
        expect(subject.matches?).to be(true)
      end
    end
  end

end