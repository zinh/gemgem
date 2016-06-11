ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "database_cleaner"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

# DatabaseCleaner.strategy = :transaction
# DatabaseCleaner.clean_with(:truncation)
DatabaseCleaner.strategy = :truncation

class MiniTest::Spec
  before :each do
    DatabaseCleaner.clean
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  # def setup
  #   DatabaseCleaner.start
  # end

  # def teardown
  #   DatabaseCleaner.clean
  # end
end

Cell::TestCase.class_eval do
  include ::Capybara::DSL
  include ::Capybara::Assertions
end
