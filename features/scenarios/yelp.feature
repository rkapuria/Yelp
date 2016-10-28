Feature: As a Yelp user I should be able to search for restaurants

  Scenario: verify the user is able to search restaurants
    Given I visit yelp.com
    And I select "Restaurants" from the search dropdown
    And I click on Search button
    And I select "restaurants pizza" from the search dropdown
    And I Report search results
    And I apply filtering options
    And I Report search results
    And I report the star rating of each restaurant
    When I expand the result 1
    Then I report contact information of the restaurant
    And I report 3 customer reviews


  Scenario Outline: verify the user is able to search requirements
    Given I visit yelp.com
    And I select "<search>" from the search dropdown
    And I click on Search button
    And I select "<search_updated>" from the search dropdown
    And I Report search results
    And I apply filtering options
    And I Report search results
    And I report the star rating of each restaurant
    When I expand the result <result_no>
    Then I report contact information of the restaurant
    And I report <review_count> customer reviews

    Examples:
      | search      | search_updated    | result_no | review_count |
      | Food        | food italian      | 2         | 2            |
      | Restaurants | restaurants vegan | 4         | 3            |
      | Delivery    | delivery chinese  | 4         | 3            |