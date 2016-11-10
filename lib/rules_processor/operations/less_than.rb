module RulesProcessor
  module Operations
    class LessThan < Base

      def perform
        condition_value.to_i > record_value.to_i
      end

    end
  end
end