Given /^I visit yelp.com$/ do
  visit("https://www.yelp.com")
end

And /^I select "([^"]*)" from the search dropdown$/ do |key|
  yelp = Yelp.new
  yelp.select_from_search(key)
end

And(/^I click on Search button$/) do
  yelp = Yelp.new
  yelp.click_search
end

And(/^I Report search results$/) do
  yelp = Yelp.new
  yelp.report_search_results
end

And(/^I apply filtering options$/) do
  yelp = Yelp.new
  yelp.filter_pricey("4")
  yelp.filter_dinner
end

And(/^I report the star rating of each of the results in the first page$/) do
  yelp = Yelp.new
  yelp.report_star_ratings
end

When(/^I click and expand the first result from the search results$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I log address, phone, website details and the first (\d+) reviews for reporting purposes$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
