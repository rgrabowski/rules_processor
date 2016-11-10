RSpec.describe RulesProcessor::ConditionMatcher do

  describe '#matches?' do
    context 'when string' do
      context 'when include at least one' do
        let(:condition) { {field: 'ticket_subject', operator: 'include', value: 'computer, email'} }
        let(:ticket) { double('ticket', subject: 'My computer is broken') }

        subject { described_class.new(condition: condition, records: {ticket: ticket}) }

        it 'returns true' do
          expect(subject.matches?).to be(true)
        end
      end

      context 'when include at least one and is case insensitive' do
        let(:condition) { {field: 'ticket_subject', operator: 'include', value: 'computer, email'} }
        let(:ticket) { double('ticket', subject: 'My Computer is broken') }

        subject { described_class.new(condition: condition, records: {ticket: ticket}) }

        it 'returns true' do
          expect(subject.matches?).to be(true)
        end
      end
    end

    context 'when array' do
      context 'when include at least one' do
        let(:condition) { {field: 'ticket_subject', operator: 'include', value: [1, 2]} }
        let(:ticket) { double('ticket', subject: ['1', '3']) }

        subject { described_class.new(condition: condition, records: {ticket: ticket}) }

        it 'returns true' do
          expect(subject.matches?).to be(true)
        end
      end
    end

  end
end