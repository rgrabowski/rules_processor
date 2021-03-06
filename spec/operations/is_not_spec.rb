RSpec.describe RulesProcessor::ConditionMatcher do

  describe '#matches?' do
    context 'when record value is string' do
      let(:condition) { {field: 'ticket_subject', operator: 'is_not', value: 'My computer is broken'} }
      let(:ticket) { double('ticket', subject: 'My computer is email') }

      subject { described_class.new(condition: condition, records: {ticket: ticket}) }

      it 'returns true' do
        expect(subject.matches?).to be(true)
      end
    end

    context 'when record value is integer' do
      let(:condition) { {field: 'ticket_requester_id', operator: 'is_not', value: '1'} }
      let(:ticket) { double('ticket', requester_id: nil) }

      subject { described_class.new(condition: condition, records: {ticket: ticket}) }

      it 'returns true' do
        expect(subject.matches?).to be(true)
      end
    end

    context 'when record_value and condition_value is nil' do
      let(:condition) { {field: 'ticket_requester_id', operator: 'is_not', value: '2'} }
      let(:ticket) { double('ticket', requester_id: nil) }

      subject { described_class.new(condition: condition, records: {ticket: ticket}) }

      it 'returns true' do
        expect(subject.matches?).to be(true)
      end
    end

  end
end