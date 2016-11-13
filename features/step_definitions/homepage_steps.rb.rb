

Given(/^I visit "([^"]*)"$/) do |arg|
  @HomePage = HomePage.new(@driver)
  @HomePage.goto_homepage
end

When(/^I search for the top "([^"]*)"$/) do |arg|
  pending
end

Then(/^I should see the top "([^"]*)" movies displayed$/) do |arg|
  pending
end

And(/^the movie "([^"]*)" is present in the list$/) do |arg|
  pending
end

Given(/^I wish to sort the displayed list$/) do
  pending
end

When(/^I select "([^"]*)" from the sort menu$/) do |arg|
  pending
end

Then(/^I should see the top "([^"]*)" sorted accordingly$/) do |arg|
  pending
end

Given(/^I wish to search movies by genre "([^"]*)"$/) do |arg|
  pending
end

Then(/^the highest rated movies of the selected genre should be displayed to me$/) do
  pending
end

And(/^I should be able to sort the list by "$/) do
  pending
end