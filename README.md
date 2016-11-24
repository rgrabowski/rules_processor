[![Code Climate](https://codeclimate.com/github/rgrabowski/rules_processor/badges/gpa.svg)](https://codeclimate.com/github/rgrabowski/rules_processor)
[![Test Coverage](https://codeclimate.com/github/rgrabowski/rules_processor/badges/coverage.svg)](https://codeclimate.com/github/rgrabowski/rules_processor/coverage)
[![Issue Count](https://codeclimate.com/github/rgrabowski/rules_processor/badges/issue_count.svg)](https://codeclimate.com/github/rgrabowski/rules_processor)
[![Build Status](https://travis-ci.org/rgrabowski/rules_processor.svg?branch=master)](https://travis-ci.org/rgrabowski/rules_processor)

# Rules Processor

Simple Business Rules Processor.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rules_processor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rules_processor
    

### Configuration

Add to `/config/initializers/rules_processor.rb` class_name which will be hold actions. This actions will be executed after rule conditions are met.

```ruby
require 'rules_processor'

RulesProcessor.configure do |config|
  config.actions_class = ::Rule::ActionsProcessor # Example class
end
```    

## Usage

### Ruleset
Array of rules designed to process. Rules order has importance.

### Rule
Rule has `conditions` and `actions`. 
Conditions are grouped in logical groups: `meet_all` and `meet_any`.

| Logical group | Description |
| --- | --- |
| `meet_all` | All conditions in group should match. |
| `meet_any` | Any condition in group should match. |

```ruby
[
  {
    meet_all: [],
    meet_any: [
        {field: 'ticket_subject', operator: 'include', value: 'return'},
        {field: 'comment_content', operator: 'include', value: 'return'}
    ],
    actions: [
        {action_name: 'ticket_set_priority', value: '1'},
        {action_name: 'ticket_assign_group', value: '3'}
    ]
  }
]
```

### Condition
Condtions has three attributes: `:field`, `:operator`, `:value`

| Attribute | Description |
|---|---|
| `field `| Proper construction of field is `prefix_ + method_name`, when prefix is record's class_name. Example: `ticket_subject`, `ticket_assignee_id`, `comment_content` |
|`operator`| [List of supported operators] (#supported-operations)|
|`value`|-|

Example condition:

```ruby
{ field: 'ticket_replies', operator: 'greater_than', value: '6' }
```

### Actions
Action has three attributes `:action_name`, `:value`.

Example action:

```ruby
{ action_name: 'set_status', value: '2' }
```

### How processor works

Public interface:

```ruby
RulesProcessor::Processor.new(records: {ticket: ticket, comment: comment},
                              options: {},
                              ruleset: set_ruleset).process
```

### Methods to compare

You can compare against any method which is defined in class of comparable record.

For example if you want to set condition:

```ruby
{ field: 'ticket_replies', operator: 'greater_than', value: '6' }
```

Just create method on your record class:

```ruby
def replies
  replies.size
end
```

### Supported operations

| Operator | Description |
| --- | --- |
| `is` | Equality comparison for string and integers |
| `is_not` | Equality comparison for string and integers |
| `include` | Contains at least one of words |
| `not_include` | Contains none of the words |
| `less_than` | Compare integers |
| `less_than_equal` | Compare integers |
| `greater_than` | Compare integers |
| `greater_than_equal` |  Compare integers |


### Operators to options for select

There are three groups of operators:

| Group | Operators |
| --- | --- |
| `base` | `include`, `not_include` |
| `includable` | `include`, `not_include` |
| `comparable` | `less_than`, `less_than_equal`, `greater_than`, `greater_than_equal` |

There is a module which returns predefined operators sets.

You can use it in such way:

``` ruby
operators = RulesProcessor::OperatorsToSelect

def ticket_subject_options
  operators.base + operators.includable
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags, and push the `.gem`
file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rgrabowski/rules_processor.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
