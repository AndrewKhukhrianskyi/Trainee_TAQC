# Gems import
require 'pry'
require 'cucumber'
require 'selenium/webdriver'
require 'rspec'

# Custom ruby files
require_relative '../../env/common_variables'
require_relative '../../page/page_class'
require_relative '../../env/driver'

Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }