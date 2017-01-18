module RulesProcessor
  class Configuration

    attr_accessor :actions_class, :conditions_class

    def initialize
      @actions_class = actions_class
      @conditions_class = conditions_class
    end

  end
end