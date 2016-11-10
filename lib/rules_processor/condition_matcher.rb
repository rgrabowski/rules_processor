module RulesProcessor
  class ConditionMatcher

    attr_accessor :records, :condition

    def initialize(args = {})
      @records   = args[:records]
      @condition = OpenStruct.new(args[:condition])
    end

    def matches?
      klass = Object.const_get(klass_name)
      klass.new(records: records, condition: condition).perform
    end

    private

    def klass_name
      camelized_operator_name = condition.operator.split('_').collect(&:capitalize).join
      "RulesProcessor::Operations::#{camelized_operator_name}"
    end

  end
end