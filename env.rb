require 'capybara'
require 'capybara/cucumber'
require 'selenium/webdriver'

# Configuring Capybara to use default driver as selenium and
# Capybara.javascript_driver and tagging scenarios with @javascript tag helps test javascripts

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.javascript_driver = :selenium
  config.page.driver.browser.manage.window.maximize
end









