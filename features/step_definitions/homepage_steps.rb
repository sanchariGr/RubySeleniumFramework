

Given(/^I visit "([^"]*)"$/) do |url|
  page = HomePage.new
  text_displayed = page.goto_homepage(url)
  assert_equal("Top Box Office (US)",text_displayed)
end

When(/^I search for the top "([^"]*)"$/) do |option|
  page = HomePage.new
  page.select_top_rated_option(option)
end

Then(/^I should see the top (\d+) movies displayed$/) do |arg|
  page = HomePage.new
  text = page.top_results_displayed
  assert_equal("Top 250 as rated by IMDb Users", text)
end

And(/^the movie "([^"]*)" is present in the list$/) do |movie_name|
  page = HomePage.new
  name_of_a_movie = page.movie_name_displayed(movie_name)
  assert_equal("The Shawshank Redemption",name_of_a_movie)
end

Given(/^I wish to sort the displayed list$/) do
  page = HomePage.new
  page.sort_dropdown
end

When(/^I select option "([^"]*)" from the sort menu$/) do |count|
  page = HomePage.new
  page.select_sort_option(count)
end

Then(/^I should see the top (\d+) sorted accordingly and "([^"]*)" is present in the list$/) do |arg1, name|
  page = HomePage.new
  movie_name = page.verify_proper_sort(name)
  assert_equal("The Shawshank Redemption",movie_name)
end

Given(/^I wish to search movies by genre "([^"]*)"$/) do |genre_type|
  page = HomePage.new
  page.genre_search
end

Then(/^the highest rated movies of the selected genre should be displayed to me$/) do
  page = HomePage.new
  search_successful = page.verify_genre_search_successful
  assert_equal("Highest Rated Western Feature Films With At Least 25000 Votes", search_successful)
end

And(/^I should be able to sort the list by rating$/) do
  page = HomePage.new
  page.sort_genre
end

