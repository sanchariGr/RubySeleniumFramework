require 'rubygems'
require 'selenium-webdriver'
require 'capybara/cucumber'

class HomePage
  include Capybara::DSL


  def initialize(driver)
    @driver = Selenium::WebDriver.for :firefox
  end

  def goto_homepage
    @driver.navigate.to "http://www.imdb.com/chart/top"
    text_displayed = @driver.find_element(:css, ".article h3").text
    assert(text_displayed.include?('IMDb Charts'))
  end

  def top_results_displayed
    page_header_text = @driver.find_element(:css, ".byLine").text
    assert(page_header_text.include?('Top 250 as rated by IMDb Users'))
  end

  def sort_options
    @driver.find_element(:css,".lister-sort-by").click
    @driver.find_element(:xpath,"//*[contains(@class, 'lister-sort-by')]/option[2]").click
  end

  def verify_proper_sort
    top_results_displayed

  end

  def genre_search

  end

  def teardown
    #quit the driver
    @driver.quit
  end

end