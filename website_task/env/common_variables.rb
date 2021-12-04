MAIN_PAGE = 'https://www.artspacesol.com/shop/'

VALID_DATA = 'Стікер'
INVALID_DATA = (0...8).map { (65 + rand(26)).chr }.join
SECURITY_TEST_DATA = ['SELECT * FROM database', '<b onmouseover=alert("Wufff!")>click me!</b>']
