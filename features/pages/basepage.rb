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
    # assert(text_displayed.include?('IMDb Charts'))
    @driver.expect(text_displayed).equal?('IMDb Charts')
  end

  def movie_name_displayed(name)
    moviename = @driver.find_element(:xpath,"//tbody[@class='lister-list']//tr[1]//td[@class='titleColumn']").text
    moviename.contains("")
  end

  def select_top_rated_option(text)
    @driver.find_element(:xpath,"//div[@class='table-cell primary']/a[text()='#{text}']").click
  end

  def top_results_displayed
    page_header_text = @driver.find_element(:css, ".byLine").text
    # assert(page_header_text.include?('Top 250 as rated by IMDb Users'))
    @driver.expect(page_header_text).equal?('Top 250 as rated by IMDb Users')
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
