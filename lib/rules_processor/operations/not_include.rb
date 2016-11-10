require_relative 'normalize_array.rb'
module RulesProcessor
  module Operations
    class NotInclude < Base

      include NormalizeArray

      def perform
        normalized_value(condition_value).none? { |i| normalized_value(record_value).include?(i) }
      end

    end
  end
end