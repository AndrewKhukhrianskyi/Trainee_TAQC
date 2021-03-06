# Adding all gems to the main file
require 'rspec'
require 'pry'
require 'selenium-webdriver'
require 'capybara'

require_relative '../env/common_variables'
require_relative '../page/main_page'
require_relative '../drivers/driver'

Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }
