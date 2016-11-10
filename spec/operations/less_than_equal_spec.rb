RSpec.describe RulesProcessor::ConditionMatcher do

  describe '#matches?' do
    subject { described_class.new(condition: condition, records: {ticket: ticket}) }

    context 'when less than' do
      let(:condition) { {field: 'ticket_replies', operator: 'less_than_equal', value: '6'} }
      let(:ticket) { double('ticket', replies: 5) }

      it 'returns true' do
        expect(subject.matches?).to be(true)
      end
    end

    context 'when equal' do
      let(:condition) { {field: 'ticket_replies', operator: 'less_than_equal', value: '5'} }
      let(:ticket) { double('ticket', replies: 5) }

      it 'returns true' do
        expect(subject.matches?).to be(true)
      end
    end
  end

end