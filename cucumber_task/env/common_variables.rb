# Link
MAIN_PAGE = 'https://demo.openmrs.org/openmrs/login.htm'
ADMIN_PAGE = 'https://demo.openmrs.org/openmrs/admin/scheduler/scheduler.form'
# Test data
PATIENT_INFO = ['dave brubeck', 'F', '56', '15.Apr.1965']
PATIENT_DATE = ['John', 'Edward', 'Snow', '25', '1984' 'aaa', '0000']

GENDER = ['Male', 'Female']
MONTHS = Array.new(13) {|m| m.to_s}
NON_IDS = [['100HM1','100HM1'], ['208HRQ', '880NNN'] ]

PATIENT_SHORT_INFO = ['John Edward Snow', GENDER[0][0], (2021 - PATIENT_DATE[4].to_i).to_s, '25.Jan.1984']
