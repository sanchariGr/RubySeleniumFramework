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
    # text_displayed = @driver.find_element(:css, ".ab_widget h1").text
    # text_displayed.should == "Top Box Office (US)"
    text_displayed = @driver.find_element(:css, ".article h3").text
    text_displayed.should == "IMDb Charts"
  end

  def movie_name_displayed(name)
    movie_name = @driver.find_element(:xpath,"//tbody[@class='lister-list']//tr[1]//td[@class='titleColumn']").text
    puts "*************************************"
    puts movie_name
    puts "*************************************"
    # movie_name.contains("")
  end

  def select_top_rated_option()
    @driver.find_element(:xpath,"//a[contains(text(),'Top Rated Movies')]").click
  end

  def top_results_displayed
    page_header_text = @driver.find_element(:css, ".byline").text
    # assert(page_header_text.include?('Top 250 as rated by IMDb Users'))
    # @driver.expect(page_header_text).equal?('Top 250 as rated by IMDb Users')
    page_header_text.should == "Top 250 as rated by IMDb Users"
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
    @driver.find_element(:xpath,"//li[@class='subnav_item_main'][21]").click
  end

  def verify_genre_search_successful
    genre_text = @driver.find_element(:css,'.article h1').text
    @driver.expect(genre_text).equal?('Highest Rated Western Feature Films With At Least 25000 Votes')
  end

  def sort_genre
    @driver.find_element(:css,'.user_rating').click
  end

  def teardown
    #quit the driver
    @driver.quit
  end

  end
