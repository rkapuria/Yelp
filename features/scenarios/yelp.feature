Feature: AS a Yelp user I should be able to search for restaurants

Scenario: verify the user is able to search restaurants
  Given I visit yelp.com
  And I select "Restaurants" from the search dropdown
  And I click on Search button
  And I select "Restaurants Pizza" from the search dropdown
  And I Report search results
  And I apply filtering options
  And I Report search results
  And I report the star rating of each of the results in the first page
  When I click and expand the first result from the search results
  Then I log address, phone, website details and the first 3 reviews for reporting purposes
