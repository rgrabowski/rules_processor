module RulesProcessor
  module Operations
    class GreaterThanEqual < Base

      def perform
        condition_value.to_i <= record_value.to_i
      end

    end
  end
end