require_relative 'normalize_array.rb'
module RulesProcessor
  module Operations
    class Include < Base

      include NormalizeArray

      def perform
        normalized_value(condition_value).any? { |i| normalized_value(record_value).include?(i) }
      end

    end
  end
end