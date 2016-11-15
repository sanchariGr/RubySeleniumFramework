require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

# if ENV['chrome']
#   Capybara.default_driver = :chrome
#   Capybara.register_driver :chrome do |app|
#     options = {
#         :js_errors => false,
#         :timeout => 360,
#         :debug => false,
#         :inspector => false,
#     }
#     Capybara::Selenium::Driver.new(app, :browser => :chrome)
#
#   end
# end


Capybara.register_driver :selenium do |app|
  Selenium::WebDriver::Firefox.path = "/Users/user/Downloads/geckodriver"
  profile = Selenium::WebDriver::Firefox::Profile.new
  Capybara::Selenium::Driver.new app, :profile => profile
end

Capybara.default_driver = :selenium
Capybara.current_session.driver.browser.manage.window.resize_to(770, 800)
Capybara.default_wait_time = 30