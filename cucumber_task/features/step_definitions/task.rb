# Add config file to the project
require_relative 'config'

# Constants
page_obj = Page.new


# Test execution
Given('opening the login page') do
  browser.get(MAIN_PAGE)
end


When('login page is opened') do

end

Then('login page is displayed') do
  expect(page_obj.url_include?(browser, 'login')).to be(true)
end

Given('patient page') do
  browser.get(MAIN_PAGE)
  page_obj.login('admin', 'Admin123')
end


When('opening patient page') do
  page_obj.find_patient_btn.click
end

Then('any column about patient is not empty') do
  PATIENT_INFO.each{|text| !expect(main_pg.columm(text)) == ''}
end

Given('patient page') do
  browser.get(MAIN_PAGE)
  page_obj.login('admin', 'Admin123')

end


When('register patient is opened and all data fields are filled') do
  page_obj.reg_process(PATIENT_NAME, PATIENT_DATE)
end

Then('user can create a new patient') do
  page_obj.find_patient_btn.click
  res = PATIENT_NAME + PATIENT_DATE
  res.each{|text| expect(main_pg.columm(text)) == text}
end

Given('patient page') do
  browser.get(MAIN_PAGE)
  page_obj.login('admin', 'Admin123')

end


When('register patient is opened and all data fields are filled') do
  page_obj.reg_process(PATIENT_NAME, PATIENT_DATE)
end

Then('Then user can not create an existed patient') do
  page_obj.find_patient_btn.click
  !expect(page_obj.url_include?) == 'index'
end
