require 'rules_processor/version'
require 'rules_processor/configuration'
require 'rules_processor/condition_matcher'
require 'rules_processor/operations/base'
require 'rules_processor/operations/greater_than_equal'
require 'rules_processor/operations/greater_than'
require 'rules_processor/operations/include'
require 'rules_processor/operations/is_not'
require 'rules_processor/operations/is'
require 'rules_processor/operations/less_than_equal'
require 'rules_processor/operations/less_than'
require 'rules_processor/operations/not_include'
require 'rules_processor/operators_to_select.rb'
require 'rules_processor/processor'
require 'rules_processor/rule_matcher'

module RulesProcessor

  class << self

    attr_accessor :configuration

  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end
