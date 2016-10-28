Before do |scenario|
  @log = File.open("reports/temp.txt", 'w')
  Capybara.default_driver = :selenium

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  Capybara.default_max_wait_time = 10
  Capybara.javascript_driver = :chrome
  Capybara.default_selector = :css
  @log = File.open("reports/temp.txt", 'w')
end

After do |scenario|
  if scenario.failed?
    begin
      embed_screenshot
    rescue
      p "*** Could not take failed scenario screenshot ***"
    end
  end
  @log.close
  begin
    embed("temp.txt", "text/plain", "\nDATA")
  rescue Exception => e
    puts e.message
    puts "*** Could Not Embed Data File ***"
  end
end

AfterStep do
  begin
    embed_screenshot
  rescue
    p "*** Could Not take screenshot ***"
  end
end

at_exit do
  title = "YELP AUTOMATION REPORT"
  report_file = File.absolute_path("yelp_report.html","reports")
  doc = File.read(report_file)
  new_doc = doc.sub("Cucumber Features", title)
  File.open(report_file, "w") {|file| file.puts new_doc }
end

def embed_screenshot
  encoded_img = page.save_screenshot("reports/tmp.png")
  temp = open("reports/tmp.png"){|io| io.read}
  encoded_img = Base64.encode64(temp)
  embed("#{encoded_img}", "image/png;base64")
end
