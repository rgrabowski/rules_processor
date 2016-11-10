module RulesProcessor
  class RuleMatcher

    attr_accessor :records, :rule, :options

    def initialize(args = {})
      @records = args[:records]
      @rule    = args[:rule]
      @options = args[:options]
    end

    def matches?
      return false if both_condition_group_empty?
      meet_all_matches? || meet_any_matches?
    end

    private

    def both_condition_group_empty?
      rule.meet_all.empty? && rule.meet_any.empty?
    end

    def meet_all_matches?
      return false if rule.meet_all.empty?
      rule.meet_all.all? { |c| condition_matcher(c).matches? }
    end

    def meet_any_matches?
      return false if rule.meet_any.empty?
      rule.meet_any.any? { |c| condition_matcher(c).matches? }
    end

    def condition_matcher(condition)
      RulesProcessor::ConditionMatcher.new(records: records, options: options, condition: condition)
    end

  end
end
