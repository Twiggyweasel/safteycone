ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "spec_helper"
require 'ffaker'
require "rspec/rails"
require "capybara/rspec"
require 'support/factory_bot'
# require "database_cleaner"
# Dir[Rails.root.join("spec/support/**/*.rb")].each { f require f}
ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|

    config.fixture_path = "#{::Rails.root}/spec/fixtures" 
    config.use_transactional_fixtures = false
    config.infer_spec_type_from_file_location!
    config.filter_rails_from_backtrace!

#     config.before(:each) do
#         DatabaseCleaner.start
#     ends
#     config.before(:suite) do
#         DatabaseCleaner.clean_with(:truncation)
#     end

  
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
  
#     config.after do |example|
#       if example.metadata[:type] == :feature
#         save_and_open_page
#         save_and_open_screenshot
#       end
#     end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end