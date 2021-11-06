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
  expect(page_obj.url_include?('login')).to be(true)
  browser.close()
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
  browser.close()
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
  browser.close()
end

Given('patient page') do
  browser.get(MAIN_PAGE)
  page_obj.login('admin', 'Admin123')

end


When('register patient is opened and all data fields are filled') do
  page_obj.reg_process(PATIENT_NAME, PATIENT_DATE)
end

Then('user can not create an existed patient') do
  page_obj.find_patient_btn.click
  !expect(page_obj.url_include?) == 'index'
  browser.close()
end

Given('system administration page') do
  browser.get(MAIN_PAGE)
  page_obj.login('admin', 'Admin123')
end

When('user click on the manage scheduler page') do
  page_obj.admin_btn.click
  page_obj.adv_btn.click
  page_obj.scheduler.click
  page_obj.add_task.click
  page_obj.task_name_field.send_keys('Test Task')
  page_obj.subtitle_field.send_keys('Subclass title text')
  page_obj.save_btn.click
end

Then('user can see added tasks on the page') do
  expect(page_obj.find_task('Test task').displayed?).to be(true)
  browser.close()
end

Given('data managemenet page') do
  browser.get(MAIN_PAGE)
  page_obj.login('admin', 'Admin123')
end

When('user click on the merge patient records') do
  page_obj.data_mng_btn.click
  page_obj.merge_btn.click
  page_obj.patient_id_1.send_keys('100HRU')
  page_obj.patient_id_2.send_keys('100HM1')
  page_obj.merge_confirm_btn.click
  page_obj.merge_patient.click
  page_obj.home_btn.click
  page_obj.find_patient_btn.click
end

Then('user can get a merged record') do
  PATIENT_INFO.each{|text| !expect(main_pg.columm(text).displayed?).to be(true)}
  browser.close()
end

Given('data managemenet page') do
  browser.get(MAIN_PAGE)
  page_obj.login('admin', 'Admin123')
end

When('user click on the merge patient records') do
  page_obj.data_mng_btn.click
  page_obj.merge_btn.click
  page_obj.patient_id_1.send_keys('100HRU')
  page_obj.patient_id_2.send_keys('100HRU')
  page_obj.merge_confirm_btn.click
end

Then('user can not get a merged record') do
  expect(page_obj.url_include?('mergePatients')).to be(true)
  browser.close()
end
