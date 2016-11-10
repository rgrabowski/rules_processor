module RulesProcessor
  module Operations
    class GreaterThan < Base

      def perform
        condition_value.to_i < record_value.to_i
      end

    end
  end
end