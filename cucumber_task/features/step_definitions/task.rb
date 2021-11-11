# Add config file to the project
require_relative 'config'

# Constants
page_obj = Page.new
when_patient = 'user click on the merge patient records'
then_patient = ['user can not merge records of the same patient',
                'user can not get a merged record of the non-existed patients']
# Test execution
browser.get(MAIN_PAGE)

Given('patient page is opened') do
  page_obj.login('admin', 'Admin123')
end


When('opening patient page') do
  page_obj.find_patient_btn.click
end

Then('patient table is not empty') do
  PATIENT_INFO.each{|data| !expect(main_pg.columm(data).text) == ''}
  page_obj.home_btn.click
end


When('register patient is opened and all data fields are filled') do
  page_obj.reg_process(PATIENT_NAME, PATIENT_DATE, GENDER[0], MONTHS[0])
end

Then('user can create a new patient') do
  page_obj.find_patient_btn.click
  res = PATIENT_NAME + PATIENT_DATE
  res.each{|data| expect(main_pg.columm(data).text) == data}
  page_obj.home_btn.click
end

When('When register patient is opened and all data fields are filled') do
  page_obj.reg_process(PATIENT_NAME, PATIENT_DATE, GENDER[0], MONTHS[0])
end

Then('user can not create an existing patient') do
  page_obj.find_patient_btn.click
  expect(page_obj.url_include?) == 'patientid'
  page_obj.home_btn.click
end

When('user click on the add task page and fill all fields by using valid data') do
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
  browser.close() # Need for the reopening page
end

Given('data management page is opened') do
  browser.get(MAIN_PAGE)
end

When('user click on the merge patient records') do
  page_obj.data_mng_btn.click
  page_obj.merge_btn.click
  page_obj.patient_id1.send_keys('100HRU') # First patient
  page_obj.patient_id2.send_keys('100HM1') # Second patient
  page_obj.merge_confirm_btn.click
  page_obj.merge_patient.click
  page_obj.home_btn.click
  page_obj.find_patient_btn.click
end


Then('user can get a merged record') do
  PATIENT_INFO.each{|text| !expect(main_pg.columm(text).displayed?).to be(true)}
  page_obj.home_btn.click
end

# Negative tests merging
# Non-existed patient & Patient with the same ID
for patient_task in 0..then_patient.length - 1
  When(when_patient) do
    page_obj.data_mng_btn.click
    page_obj.merge_btn.click
    page_obj.patient_id1.send_keys(NON_IDS[patient_task][0])
    page_obj.patient_id2.send_keys(NON_IDS[patient_task][1])
    page_obj.merge_confirm_btn.click
  end

  Then(then_patient[patient_task]) do
    # add button blocking
    expect(page_obj.url_include?('mergePatients')).to be(true)
  end

end

browser.close()
