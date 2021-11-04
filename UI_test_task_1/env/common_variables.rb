# Link
MAIN_PAGE = 'https://s1.demo.opensourcecms.com/wordpress/'

# Test data
VALID_DATA = 'Sample Page'
INVALID_DATA = rand(10000).to_s

# Test data (Security testing)
SQL = 'SELECT * FROM table'
XSS = '<img src="http://url.to.file.which/not.exist" onerror=alert(document.cookie);>'
