module RulesProcessor
  module Operations
    class Is < Base

      def perform
        record_value.to_s == condition_value.to_s
      end

    end
  end
end
