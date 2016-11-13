Feature:


  Scenario:


    Given I visit ""
    When I search for the top "250"
    Then I should see the top "250" movies displayed
    And the movie "" is present in the list


    Given I wish to sort the displayed list
    When I select "" from the sort menu
    Then I should see the top "" sorted accordingly


    Given I wish to search movies by genre ""
    Then the highest rated movies of the selected genre should be displayed to me
    And I should be able to sort the list by "