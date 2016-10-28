class Yelp
  include Capybara::DSL

  def initialize(log)
    @log = log
  end

  def select_from_search(txt)
    find("#find_desc", :visible => false).set(txt)
    find("li[data-suggest-query='#{txt}']>div").click
    wait_for_ajax
  end

  def click_search
    find("#header-search-submit").click
    wait_for_ajax
  end

  def report_search_results
    @log << "Search Results :\n"
    result = find(".pagination-results-window").text
    final = result.split("-").last.split(" of ")
    puts "Results Displayed of current page = #{final.first}"
    puts "Total number of search results = #{final.last}"
    @log << "\nResults Displayed of current page = #{final.first}\n"
    @log << "Total number of search results = #{final.last} \n\n"
    @log << "*"*50+"\n"
  end

  def filter_dinner
    find(".suggested-filters_filter-list [value*='PlatformDelivery']~span").click
    wait_for_ajax
  end

  def filter_pricey(range)
    find(".suggested-filters_price-filters [value*='Range2.#{range}']~span").click
    wait_for_ajax
  end

  def report_star_ratings
    @log << "\nRestaurant Ratings: \n\n"
    titles = page.all(".regular-search-result h3")
    stars = page.all(".regular-search-result i")
    titles.each_with_index do |title, index|
      star = stars[index][:title].split(" ").first
      puts "#{title.text} -- #{star} stars \n"
      @log << "#{title.text} -- #{star} stars \n"
    end
    @log << "\n"+"*"*50+"\n"
  end

  def open_search_result(index)
    find(".regular-search-result:nth-of-type(#{index}) h3 a").click
  end

  def report_contact_info
    @log << "\nCONTACT INFO"
    address = find(".map-box-address").text
    puts "Address: \n" + address
    @log << "\n\nAddress: \n" + address
    phone = find(".biz-phone").text
    puts "Phone Number: #{phone}"
    @log << "\n\nPhone Number:\n" + phone
    web = find(".biz-website>a").text
    puts "Website : #{web}"
    @log << "\n\nWebsite:\n" + web + "\n\n"
  end

  def report_reviews(count)
    all_reviews = page.all(".review[data-review-id] .review-content p")
    count.to_i.times do |i|
      puts "*"*50
      puts all_reviews[i].text
      @log << "*"*50
      @log << "\n\n REVIEW-#{i+1}\n"
      @log << "\n\n" + all_reviews[i].text + "\n\n"
    end
    @log << "*"*50
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until page.evaluate_script('jQuery.active').zero?
    end
  end

end

