# RubySeleniumFramework
A simple Ruby Selenium automation framework using Capybara and a BDD Framework called Cucumber

Capybara helps you test web applications by simulating how a real user would interact with your app
Cucumber is a simple BDD framework that makes your automation tests more readable

The suite has been designed taking into account the Page-Object Model which helps keep your tests maintainable and
reusable. Page level methods have been separated into a separate class which finds a web-element and fills values etc.
The page numbers would increase depending upon complexity of the automation suite. This is very useful because
in future if there is change in the web element , we need to make change in just 1 class file and not 10 different scripts.

The step_definitions folder containing the step definition files which invokes the page methods and does assertions.

# Installing and Running tests :
- git clone git@github.com:sanchariGr/RubySeleniumFramework.git
- Install Rvm and Ruby(my version : ruby-2.1.3)
- Install bundler
- bundle install (The Gemfile should take care of all the gems required to run the tests)
- Firefox version 35.0.1
(with a higher Firefox version 'Capybara::Selenium::Driver' has to be set with 'Remote::Capabilities.firefox(marionette: false)')
- Run tests using 'cucumber' from the project location




