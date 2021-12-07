require 'nokogiri'
require 'open-uri'
require 'json'

puts 'What would you like to find? '
search_element = gets
search_element.include?(' ') ? search_element.gsub!(' ', '+').chomp : search_element.chomp

html_page = Nokogiri::HTML(URI.open("https://www.google.com/search?q=#{search_element}"))
search_results = html_page.xpath("//div/a/h3//text()")
# Bug - no links
links = html_page.xpath('//cite')

# All searchable results
puts '--- All founded results: ---'
puts search_results
puts '--- Links: ---'
puts links
