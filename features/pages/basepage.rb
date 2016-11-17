require 'rubygems'
require 'selenium/webdriver'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'pry'


class HomePage
  include Capybara::DSL


  def goto_homepage(navigate_url)
    visit navigate_url
    text_displayed = find(:css, ".ab_widget h1").text
    return text_displayed
  end


  def movie_name_displayed(name)
    movie_name = find(:xpath,"//a[contains(text(),'#{name}')]").text
    return movie_name
  end


  def select_top_rated_option(option_text)
    find(:xpath,"//div[@class='table-cell']//a[contains(text(),'#{option_text}')]").click
  end


  def top_results_displayed
    page_header_text = find(:css, ".byline").text
    return page_header_text
  end


  def sort_dropdown
    find(:css,".lister-sort-by").click
  end


  def select_sort_option(count)
    find(:xpath,"//div[@class='nav']//select[@class='lister-sort-by']//option[#{count}]").click
  end


  def verify_proper_sort(name)
    top_results_displayed
    movie_name_displayed(name)
  end


  def genre_search(genre_type)
    page.execute_script "window.scrollBy(0,1000)"

    # The link "Western" needs to be in focus for selenium to be able to click it. This is done via a page.execute with
    # a explicit javascript event trigger .focus()

    page.execute_script("($('.ab_widget .quicklinks li.subnav_item_main a').last()).focus()")
    find_link("#{genre_type}").click
  end


  def verify_genre_search_successful
    genre_text = find(:css,'.article h1').text
    return genre_text
  end


  def sort_genre
    find(:css,'.user_rating').click
  end


  def teardown
    #quit the driver

    @driver.quit
  end

  end
