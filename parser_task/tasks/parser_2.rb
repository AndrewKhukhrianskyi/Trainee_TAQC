require 'nokogiri'
require 'open-uri'
require 'json'

puts 'What would you like to find? '
search_element = gets
arr_links = []

search_element.include?(' ') ? search_element.gsub!(' ', '+').chomp : search_element.chomp

html_page = Nokogiri::HTML(URI.open("https://www.google.com/search?q=#{search_element}"))
search_results = html_page.xpath("//div/a/h3//text()")

# Adds only founded links by using google search
html_page.xpath('//a[@href]').each {|link| arr_links.push(link['href'].gsub!('/url?q=', '')) if !link['href'].include?('google') && !link['href'].include?('search') && !link['href'].include?('youtube')}

# Go to the third from the end website (task requirement) & broken link avoiding
web_page = Nokogiri::HTML(URI.open(arr_links[-3].match('^[a-z]+\W+[a-z]+\W+[a-z]+\W+[a-z]+').to_s))

puts '--- All founded results: ---'
puts search_results

puts '--- Links: ---'
puts arr_links

puts '--- Checked link ---'
puts web_page.title
