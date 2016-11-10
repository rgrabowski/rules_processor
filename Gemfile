source 'https://rubygems.org'

# Specify your gem's dependencies in rules_processor.gemspec
gemspec

group :test do
  gem 'simplecov'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
end

group :development, :test do
  gem 'rubocop', require: false
  gem 'byebug'
end