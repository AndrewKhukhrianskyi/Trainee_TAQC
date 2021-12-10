require 'nokogiri'
require 'open-uri'
require 'json'

puts 'What would you like to find? '
search_element = gets
arr_links = []
filtered_links = []
results = {}

search_element.include?(' ') ? search_element.gsub!(' ', '+').chomp : search_element.chomp

html_page = Nokogiri::HTML(URI.open("https://www.google.com/search?q=#{search_element}"))

puts html_page.css('a').map{|link| link['href']}

html_page.xpath('//a[@href]').each {|link| arr_links.push(link['href'].gsub!('/url?q=', '')) if !link['href'].include?('google') && !link['href'].include?('search') && !link['href'].include?('youtube')}

arr_links.each do |link|
  filtered_links.push(link.match('^[a-z]+\W+[a-z]+\W+[a-z]+\W+[a-z]+').to_s) if !link.is_a? NilClass
end

arr_id = Array.new(filtered_links.length) {|num| num + 1}

for result in 0..arr_id.length - 1
    results.store(arr_id[result], filtered_links[result])
end


# Go to the third from the end website (task requirement) & broken link avoiding
web_page = Nokogiri::HTML(URI.open(filtered_links[-3]))

puts '--- Links: ---'
results.each_pair{|k,v| puts "Website number #{k} --- Link: #{v}"}

puts '--- Checked link ---'
puts web_page.title
