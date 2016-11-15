Feature: IMDb top 250 search and sort


  Scenario: Search IMDb for the top rated movies based on different sort options and


    Given I visit "http://www.imdb.com/chart"
    When I search for the top "Top Rated Movies"
    Then I should see the top 250 movies displayed
    And the movie "The Shawshank Redemption" is present in the list


    Given I wish to sort the displayed list
    When I select option "2" from the sort menu
    Then I should see the top 250 sorted accordingly


    Given I wish to search movies by genre "Western"
    Then the highest rated movies of the selected genre should be displayed to me
    And I should be able to sort the list by rating