# Gems
require 'nokogiri'
require 'open-uri'
require 'json'

# Constants
html_page = Nokogiri::HTML(URI.open('https://www.ukr.net/'))
links = html_page.xpath('//a')

# Non-filtered links (e.g javascript stuff)
all_links = links.map {|clear_link| clear_link['href'] if clear_link['href']}.compact

puts 'ALL FOUNDED LINKS'
puts '-----------------'
puts all_links.delete_if{|elem| !elem.include?('www') || !elem.include?('http') || !elem.include?('https') || !elem.include?('//www')}
