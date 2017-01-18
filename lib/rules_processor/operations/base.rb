module RulesProcessor
  module Operations
    class Base

      attr_accessor :value,
                    :options,
                    :records,
                    :condition,
                    :record_value,
                    :condition_value,
                    :record_class,
                    :field

      def initialize(args = {})
        @records          = args[:records]
        @condition        = OpenStruct.new(args[:condition])
        @record_class     = condition.field.split('_', 2)[0].to_sym
        @field            = condition.field.split('_', 2)[1].to_sym
        @record_value     = actual_value
        @condition_value  = nullified_value
      end

      def perform
        fail NotImplementedError
      end

      private

      def actual_value
        klass = RulesProcessor.configuration.conditions_class
        klass.new(record: records[record_class]).public_send(condition.field)
      end

      def nullified_value
        return nil if condition.value == ''
        condition.value
      end

    end
  end
end
