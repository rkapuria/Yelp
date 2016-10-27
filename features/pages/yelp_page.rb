class Yelp
  include Capybara::DSL


  def select_from_search(txt)
    find("#find_desc").click
    find("li[data-suggest-query='Restaurants']>div").click
  end

  def click_search
    find("#header-search-submit").click
  end

  def report_search_results
    result = find(".pagination-results-window").text
    final = result.split("-").last.split(" of ")
    puts "Results Displayed of current page = #{final.first}"
    puts "Total number of search results = #{final.last}"
  end

  def filter_dinner
    find("[value*='dinner']").click

  end

  def filter_pricey(range)
    find(".suggested-filters_price-filters [value*='Range2.#{range}']").click
  end

  def report_star_ratings
    titles = page.all(".regular-search-result h3")
    stars = page.all(".regular-search-result i")
    titles.each_with_index do |title, index|
      star = stars[index][:title].split(" ").first
      puts = "#{index+1} : #{title.text} -- #{star} stars"
    end
  end


end
