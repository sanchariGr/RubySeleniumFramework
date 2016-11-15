require 'capybara'
require 'capybara/cucumber'
require 'selenium/webdriver'




# Selenium 3.0.0 + Firefox 49 uses geckodriver to run tests
#doccumentation: https://github.com/mozilla/geckodriver

# In order to use Firefox driver
# Capybara.register_driver :selenium do |app|
#   Selenium::WebDriver::Firefox.path = "<path to geckodriver>"
#   profile = Selenium::WebDriver::Firefox::Profile.new
#   Capybara::Selenium::Driver.new app, :profile => profile
# end

# before(:all) do
#   Capybara.current_driver = :selenium
# end
#

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  # config.current_driver = :selenium
  config.app_host = 'http://www.imdb.com/chart'
end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  session = Capybara::Selenium::Driver.new app, :profile =>profile
  # session = Capybara::Session.new(:culerity)
  session.visit('http://www.google.com')
end



# # Setup Capybara to point to the deployed instance of playthepools.
# Capybara.register_driver :selenium do |app|
#   profile = Selenium::WebDriver::Firefox::Profile.new
#   profile.add_extension File.join(File.dirname(__FILE__), 'extensions/JSErrorCollector.xpi')
#   Capybara::Selenium::Driver.new app, :profile => profile
# end






