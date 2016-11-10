RSpec.describe RulesProcessor::OperatorsToSelect do
  subject { RulesProcessor::OperatorsToSelect }

  describe '.base' do
    let(:output) { [:is, :is_not] }
    it 'response with proper hash' do
      expect(subject.base).to eq(output)
    end
  end

  describe '.includable' do
    let(:output) { [:include, :not_include] }
    it 'response with proper hash' do
      expect(subject.includable).to eq(output)
    end
  end

  describe '.comparable' do
    let(:output) { [:less_than, :less_than_equal, :greater_than, :greater_than_equal] }
    it 'response with proper hash' do
      expect(subject.comparable).to eq(output)
    end
  end
end