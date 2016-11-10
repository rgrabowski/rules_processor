RSpec.describe RulesProcessor::ConditionMatcher do

  describe '#matches?' do
    context 'when string' do
      context 'when NOT include any' do
        let(:condition) { {field: 'ticket_subject', operator: 'not_include', value: 'phone, email'} }
        let(:ticket) { double('ticket', subject: 'My computer is broken') }

        subject { described_class.new(condition: condition, records: {ticket: ticket}) }

        it 'returns true' do
          expect(subject.matches?).to be(true)
        end
      end
    end

    context 'when array' do
      context 'when NOT include any' do
        let(:condition) { {field: 'ticket_subject', operator: 'not_include', value: [1, 2]} }
        let(:ticket) { double('ticket', subject: [5, 6]) }

        subject { described_class.new(condition: condition, records: {ticket: ticket}) }

        it 'returns true' do
          expect(subject.matches?).to be(true)
        end
      end
    end

  end
end