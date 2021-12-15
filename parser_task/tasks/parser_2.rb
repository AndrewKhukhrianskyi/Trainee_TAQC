require 'google_search_results'

puts 'What would you like to find?'
query = gets.chomp

puts 'Which pages do you need? (0 page means that you find all results on the first page)'
page = gets.chomp

# Query requirements
params = {
  engine: 'google',
  q: query,
  api_key: '3202a7c968cd50fc6bb50da69472015d63fd01bce67903cc5d1144cafdbd5ec5',
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
