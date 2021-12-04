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
