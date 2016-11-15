require 'rubygems'
require 'selenium/webdriver'
require 'capybara/cucumber'
require 'capybara/dsl'

class HomePage
  include Capybara::DSL

  def setup
    before(:all) do
      Capybara.current_driver = :selenium
    end
  end


  def initialize(driver)
    @driver = Selenium::WebDriver.for :firefox

    # @driver = Capybara::RackTest::Browser.new(self)
  end


  def goto_homepage(navigate_url)
    @driver.navigate.to "#{navigate_url}"
    # @driver.visit("#{navigate_url}")
    text_displayed = @driver.find_element(:css, ".ab_widget h1").text
    return text_displayed
  end


  def movie_name_displayed(name)
    @driver.find_element(:xpath,"//a[contains(text(),'#{name}')]").text
  end

  def select_top_rated_option(option_text)
    @driver.find_element(:xpath,"//a[contains(text(),'#{option_text}')]").click
  end

  def top_results_displayed
    page_header_text = @driver.find_element(:css, ".byline").text
    return page_header_text
  end


  def sort_dropdown
    @driver.find_element(:css,".lister-sort-by").click
  end

  def select_sort_option(count)
    @driver.find_element(:xpath,"//*[contains(@class, 'lister-sort-by')]/option['#{count}']").click
  end

  def verify_proper_sort
    top_results_displayed
    movie_name_displayed(name)
  end

  def genre_search(type)
    @driver.find_element(:xpath,"//li[@class='subnav_item_main']/a[contains(text(),'#{type}')]").click
  end

  def verify_genre_search_successful
    genre_text = @driver.find_element(:css,'.article h1').text
    return genre_text
  end

  def sort_genre
    @driver.find_element(:css,'.user_rating').click
  end

  def teardown
    #quit the driver

    @driver.quit
  end

  end
