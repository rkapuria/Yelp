require 'rspec'
require 'selenium-webdriver'
require 'cucumber'
require 'rake'
require 'testnow'
require 'capybara'
require 'capybara/cucumber'

include RSpec::Matchers
include TestNow

Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.javascript_driver = :chrome
Capybara.default_selector = :css