# Task 1 - Find email
puts 'TASK 1 - FIND EMAIL'
puts '-------------------'
puts 'RESULTS: '
regex_arr = ['test@softserveic.com', 'spam',
            'eggs', 'xxx', 'iriska2015@test.com',
            'anotheremail@ukr.net', 'qqq', '123@test.com']

regex_arr.each{|is_email| puts "#{is_email} is email" if !is_email.match('^[a-zA-Z0-9]+\S[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]+').is_a? NilClass}

puts ''
# Task 2 - Extract from URL
puts 'TASK 2 - EXTRACT FROM URL'
puts '------------------'
puts 'RESULTS: '
url_string = 'https://jira.sco.cisco.com/secure/RapidBoard.jspa?rapidView=98&view=detail&selectedIssue=AVCTOOLS-2390'

puts url_string.match('[a-zA-Z0-9]+=+[0-9]+')
puts url_string.match('[a-z]+=[a-z]+')
