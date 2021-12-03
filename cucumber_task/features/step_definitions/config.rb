# Gems import
require 'pry'
require 'cucumber'
require 'selenium/webdriver'
require 'rspec'


# Custom ruby files import
require_relative '../../env/common_variables'
require_relative '../../env/driver'


Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require_relative f }
