require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

if ENV['chrome']
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    options = {
        :js_errors => false,
        :timeout => 360,
        :debug => false,
        :inspector => false,
    }
    Capybara::Selenium::Driver.new(app, :browser => :chrome)

  end
end
