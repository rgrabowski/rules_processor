module RulesProcessor
  module Operations
    class IsNot < Base

      def perform
        record_value != condition_value
      end

    end
  end
end
