require 'rspec'
require 'pry'
require 'selenium-webdriver'
require 'capybara'

require_relative '../env/common_variables'
require_relative '../pages/page_class'
require_relative '../drivers/driver'

Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }
