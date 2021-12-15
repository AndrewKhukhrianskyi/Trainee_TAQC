require 'google_search_results'

puts 'What would you like to find?'
query = gets.chomp

puts 'Which page do you need? (0 page means that you find all results on the first page)'
page = gets.chomp

# Query requirements
params = {
  engine: 'google',
  q: query,
  api_key: 'your_api_key',
  start: page
}

# Get all data from the request
search = GoogleSearch.new(params)
res = search.get_json.to_s

arr_res = res.split
links = []

# Filtering
arr_res.each{|element| links.push(element) if element.include?('www') && !element.include?('google')}

# Results
puts '------- VIDEOS --------'
links.each{|l| puts l if l.include?('youtube')}
puts '-----------------------'

puts '-------- NEWS ---------'
links.each{|l| puts l if l.include?('news')}
puts '-----------------------'

puts '---- OTHER RESULTS ----'
links.each{|l| puts l if !l.include?('news') && !l.include?('youtube')}
