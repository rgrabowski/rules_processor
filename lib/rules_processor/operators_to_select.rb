module RulesProcessor
  module OperatorsToSelect

    def self.base
      [:is, :is_not].freeze
    end

    def self.includable
      [:include,
       :not_include].freeze
    end

    def self.comparable
      [:less_than,
       :less_than_equal,
       :greater_than,
       :greater_than_equal].freeze
    end

  end
end
