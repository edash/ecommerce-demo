require "bundler"
require "capybara/dsl"
require "capybara/rspec"
require "./spec/support/login_helper"

Bundler.setup(:default)
Bundler.require

# Which default browser do you want Selenium WebDriver to use?
# :selenium_chrome # Selenium driving Chrome
# :selenium_chrome_headless # Selenium driving Chrome in a headless configuration
# https://github.com/teamcapybara/capybara#selenium

Capybara.default_driver = :selenium_chrome
Capybara.app_host = "http://automationpractice.com/"
Capybara.default_max_wait_time = 5
# Disable Capybara's rack server as we are testing an external site
Capybara.run_server = false

# Run using:
# bundle exec rspec spec/features/login.rb --format documentation
# ... Or...

RSpec.configure do |config|
  # use verbose test results output
  config.formatter = :documentation
  #use helper method
  config.include LoginHelper
end
