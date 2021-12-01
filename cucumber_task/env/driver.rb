# Gems adding
require 'selenium/webdriver'
require 'rspec'
require 'capybara'

# Adds Driver class which helps to execute tests
class Driver
  def initialize
    return 'NO BROWSER!' if ENV['BROWSER'].nil?
    $driver = Selenium::WebDriver.for ENV['BROWSER'].to_sym
  end
end

Driver.new

def browser
  $driver
end
