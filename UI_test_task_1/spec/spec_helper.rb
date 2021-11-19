# Adding all gems to the main file
require 'rspec'
require 'pry'
require 'selenium-webdriver'
require 'capybara'

require_relative '../env/common_variables'
require_relative '../pages/main_page'
require_relative '../drivers/driver'

def start(page_obj)
  # some return
end

Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }
