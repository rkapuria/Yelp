Given /^I visit yelp.com$/ do
  visit("https://www.yelp.com")
end

And(/^I select "([^"]*)" from the search dropdown$/) do |key|
  yelp = Yelp.new(@log)
  yelp.select_from_search(key)
end

And(/^I click on Search button$/) do
  yelp = Yelp.new(@log)
  yelp.click_search
end

And(/^I Report search results$/) do
  yelp = Yelp.new(@log)
  yelp.report_search_results
end

And(/^I apply filtering options$/) do
  yelp = Yelp.new(@log)
  yelp.filter_pricey("1")
  yelp.filter_dinner
end

And(/^I report the star rating of each restaurant$/) do
  yelp = Yelp.new(@log)
  yelp.report_star_ratings
end

When(/^I expand the result (\d+)$/) do |index|
  yelp = Yelp.new(@log)
  yelp.open_search_result(index)
end

Then(/^I report contact information of the restaurant$/) do
  yelp = Yelp.new(@log)
  yelp.report_contact_info
end

Then(/^I report (\d+) customer reviews$/) do |count|
  yelp = Yelp.new(@log)
  yelp.report_reviews(count)
end