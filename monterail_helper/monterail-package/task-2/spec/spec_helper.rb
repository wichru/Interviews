require "bundler/setup"
Bundler.require
ENV["APP_ENV"] ||= "test"
require "./config/application"

require "./app/models/application_record.rb"
Dir["./app/**/*.rb"].each { |file| require file }
Dir["./spec/support/*.rb"].each { |file| require file }

ActiveRecord::Base.establish_connection(DB_CONFIG)
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
