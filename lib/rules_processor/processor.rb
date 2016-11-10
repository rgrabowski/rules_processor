module RulesProcessor
  class Processor

    attr_accessor :records, :ruleset, :options

    def initialize(args = {})
      @records = args[:records]
      @ruleset = args[:ruleset]
      @options = args[:options]
    end

    def process
      ruleset.each do |rule|
        mark_skipped(rule) && next if already_matched?(rule)
        mark_not_match(rule) && next unless rule_matches?(rule)

        mark_match(rule) && actions_processor(rule)

        process
        break
      end
      matching_result
    end

    private

    def matching_result
      @matching_result ||= []
    end

    def mark_match(rule)
      matching_result << {rule.id => :match}
      already_matched << rule.id
    end

    def mark_not_match(rule)
      matching_result << {rule.id => :not_match}
    end

    def mark_skipped(rule)
      matching_result << {rule.id => :skipped}
    end

    def already_matched
      @already_matched ||= []
    end

    def already_matched?(rule)
      already_matched.include?(rule.id)
    end

    def rule_matches?(rule)
      RulesProcessor::RuleMatcher.new(records: records, rule: rule, options: options).matches?
    end

    def actions_processor(rule)
      klass = RulesProcessor.configuration.actions_class
      klass.new(records: records, rule: rule, options: options).process
    end

  end
end
