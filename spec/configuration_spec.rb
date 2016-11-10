RSpec.describe RulesProcessor::Configuration do

  context 'when action class is NOT specified' do
    it 'returns specified class name' do
      expect(RulesProcessor.configuration.actions_class).to eq nil
    end
  end

  context 'when actions class is specified' do
    before do
      RulesProcessor.configure do |config|
        config.actions_class = ::ActionsProcessor
      end
    end

    it 'returns specified class' do
      expect(RulesProcessor.configuration.actions_class).to eq ::ActionsProcessor
    end
  end

end
