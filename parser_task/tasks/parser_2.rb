require 'google_search_results'

puts 'What would you like to find?'
query = gets.chomp

puts 'Which page do you need? (0 page means that you find all results on the first page)'
page = gets.chomp

puts 'Which search engine would you like to use? (e.g google, bing etc.)'
eng = gets.chomp

puts 'Enter your API key (Copy your API key and paste him in the field below): '
api = gets.chomp
# Query requirements
params = {
  engine: eng,
  q: query,
  api_key: api,
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
