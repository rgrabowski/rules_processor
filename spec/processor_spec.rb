require 'ostruct'

RSpec.describe RulesProcessor::Processor do

  before do
    RulesProcessor.configure do |config|
      config.actions_class = ActionsProcessor
      config.conditions_class = ConditionsProcessor
    end
    allow_any_instance_of(described_class).to receive(:actions_processor).and_return(true)
  end

  subject do
    RulesProcessor::Processor.new(records: records, ruleset: ruleset, options: {}).process
  end

  context 'when meet_all' do
    let(:ticket) { double('ticket', status: 3, subject: 'Computer issue') }
    let(:comment) { double('comment', content: 'My computer is broken.') }

    let(:ruleset) do
      [
          OpenStruct.new(
              id: 1,
              meet_all: [{field: 'ticket_status', operator: 'is', value: '1'}],
              meet_any: [{field: 'comment_content', operator: 'include', value: 'computer'}],
              actions: [{action_name: 'ticket_set_status', value: '2'}]
          ),
          OpenStruct.new(
              id: 2,
              meet_all: [{field: 'ticket_status', operator: 'is', value: '3'}],
              meet_any: [{field: 'comment_content', operator: 'include', value: 'computer'}],
              actions: [{action_name: 'ticket_set_status', value: '2'}]
          )
      ]
    end

    let(:records) do
      {
          ticket: ticket, comment: comment
      }
    end

    it 'process rules' do
      processing_order = [{1 => :match}, {1 => :skipped}, {2 => :match}, {1 => :skipped}, {2 => :skipped}]
      expect(subject).to eq(processing_order)
    end
  end

  context 'when meet_any' do
    let(:ticket) { double('ticket', status: 1, subject: 'Computer issue', set_status: true, save: true) }
    let(:comment) { double('comment', content: 'My computer is broken.', save: true) }

    let(:ruleset) do
      [
          OpenStruct.new(
              id: 1,
              meet_all: [],
              meet_any: [{field: 'comment_content', operator: 'include', value: 'computer'}],
              actions: [{action_name: 'ticket_set_status', value: '2'}]
          )
      ]
    end

    let(:records) do
      {
          ticket: ticket, comment: comment
      }
    end

    it 'process rules' do
      processing_output = [{1 => :match}, {1 => :skipped}]
      expect(subject).to eq(processing_output)
    end
  end
end