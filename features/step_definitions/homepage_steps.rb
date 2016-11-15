

Given(/^I visit "([^"]*)"$/) do |arg|
  @HomePage = HomePage.new(@driver)
  @HomePage.goto_homepage
end

When(/^I search for the top "([^"]*)"$/) do |option|
  @HomePage = HomePage.new(@driver)
  @HomePage.select_top_rated_option()
end

Then(/^I should see the top "([^"]*)" movies displayed$/) do |arg|
  @HomePage = HomePage.new(@driver)
  @HomePage.top_results_displayed
end

And(/^the movie "([^"]*)" is present in the list$/) do |movie_name|
  @HomePage = HomePage.new(@driver)
  @HomePage.movie_name_displayed(movie_name)
end

Given(/^I wish to sort the displayed list$/) do
  @HomePage = HomePage.new(@driver)
  @HomePage.sort_dropdown
end

When(/^I select option "([^"]*)" from the sort menu$/) do |count|
  @HomePage = HomePage.new(@driver)
  @HomePage.select_sort_option(count)
end

Then(/^I should see the top "([^"]*)" sorted accordingly$/) do |arg|
  @HomePage = HomePage.new(@driver)
  @HomePage.verify_proper_sort
end

Given(/^I wish to search movies by genre "([^"]*)"$/) do |genre_type|
  @HomePage = HomePage.new(@driver)
  @HomePage.genre_search(genre_type)
end

Then(/^the highest rated movies of the selected genre should be displayed to me$/) do
  @HomePage = HomePage.new(@driver)
  @HomePage.verify_genre_search_successful
end

And(/^I should be able to sort the list by "([^"]*)"$/) do |arg|
  @HomePage = HomePage.new(@driver)
  @HomePage.sort_genre
end