# Add config file to the project
require_relative 'config'

# Constants
page_obj = Page.new

# Test execution
browser.get(MAIN_PAGE)
page_obj.login('admin', 'Admin123')



When('opening patient page') do
  page_obj.find_patient_btn.click
end

Then('patient table is not empty') do
  #page_obj.column_arr.each{|col| expect(col.text.empty?).to be(false)}
  # Bad practice. I know
  expect(page_obj.columm_id.text.empty? && page_obj.column_name.text.empty? && page_obj.column_gender.text.empty? && page_obj.column_age.text.empty? && page_obj.column_date.text.empty?).to be(false)
  page_obj.home_btn.click
end


When('user fills all fields on patient register page') do
  page_obj.reg_btn.click
  page_obj.name.send_keys(PATIENT_DATE[0]) # name
  page_obj.middle_name.send_keys(PATIENT_DATE[1]) # Middle name
  page_obj.surename.send_keys(PATIENT_DATE[2]) # Surename

  page_obj.nxt_btn.click
  # Gender page
  page_obj.gender(GENDER[0]).click
  page_obj.right_nxt_btn.click
  # Date page
  page_obj.day.send_keys(PATIENT_DATE[3]) # day
  page_obj.month.click
  page_obj.month.click # month
  page_obj.month_set(MONTHS[1]).click # month

  page_obj.year.send_keys(PATIENT_DATE[4]) # year
  page_obj.right_nxt_btn.click
  # Address
  page_obj.address.send_keys(PATIENT_DATE[5])
  page_obj.right_nxt_btn.click
  # Phone
  page_obj.phone.send_keys(PATIENT_DATE[6])
  page_obj.right_nxt_btn.click
  # skip relationships

  page_obj.right_nxt_btn.click
  page_obj.submit_btn.click

  @patient_id = page_obj.patient_id_icon.text
  page_obj.home_btn.click
end

# Try to test right here
Then('new patient is created') do
  page_obj.find_patient_btn.click
  res = [@patient_id].concat(PATIENT_SHORT_INFO)
  # page_obj.column_arr.each{}
  # Bad practice. Again.
  expect(page_obj.columm_id.text.include?(res[0]) && page_obj.column_name.text.include?(res[1]) && page_obj.column_gender.text.include?(res[2]) && page_obj.column_age.text.include?(res[3]) && page_obj.column_date.text.include?(res[4]))
  page_obj.home_btn.click
end

When('When register patient is opened and all data fields are filled') do
  page_obj.reg_btn.click
  page_obj.name.send_keys(PATIENT_DATE[0]) # name
  page_obj.middle_name.send_keys(PATIENT_DATE[1]) # Middle name
  page_obj.surename.send_keys(PATIENT_DATE[2]) # Surename
  page_obj.nxt_btn.click
  # Gender page
  page_obj.gender(GENDER[0]).click
  page_obj.right_nxt_btn.click
  # Date page
  page_obj.day.send_keys(PATIENT_DATE[3]) # day
  page_obj.month.click # month
  page_obj.month_set(MONTHS[0]).click
  page_obj.year.send_keys(PATIENT_DATE[4]) # year
  page_obj.right_nxt_btn.click
  # Address
  page_obj.address.send_keys(PATIENT_DATE[5])
  page_obj.right_nxt_btn.click
  # Phone
  page_obj.phone.send_keys(PATIENT_DATE[6])
  page_obj.right_nxt_btn.click
  #skip relationships
  page_obj.right_nxt_btn.click
end

# Bug founded - we can create an existed patient
Then('user can not create an existing patient') do
  expect(page_obj.submit_btn.enabled?).to be(false)
  page_obj.home_btn.click
end



# Bug - non-interactable elements
=begin
When('user click on the add task page and fill all fields by using valid data') do
  browser.get(ADMIN_PAGE)
  page_obj.task_name_field.send_keys('Auto Close Visits Task')
  page_obj.subtitle_field.send_keys('org.openmrs.scheduler.tasks.AutoCloseVisitsTask')
  page_obj.save_btn.click
end

Then('user can see added tasks on the page') do
  expect(page_obj.find_task('Auto Close Visits Task').displayed?).to be(true)
  page_obj.home_nav_btn.click
=end

# Working test
=begin
When('user click on the merge patient records') do
  page_obj.data_mng_btn.click
  page_obj.merge_btn.click
  page_obj.patient_id1.send_keys('100J8U') # First patient
  page_obj.patient_id2.send_keys('100HM1') # Second patient
  page_obj.merge_confirm_btn.click
  page_obj.merge_confirm_btn.click
  page_obj.merge_patient.click
  page_obj.merge_confirm_btn.click
end


Then('user can get a merged record') do
  expect(page_obj.expected_id1.text.include?('1003HP') && page_obj.expected_id2.text.include?('100HM1')).to be(true)
  page_obj.home_btn.click
=end

  # Negative tests merging
  # Non-existed patient & Patient with the same ID

When('user click on the merge patient records by using one and the same patient data') do
  page_obj.data_mng_btn.click
  page_obj.merge_btn.click
  page_obj.merge_confirm_btn.click
  page_obj.patient_id1.send_keys(NON_IDS[0][0])
  page_obj.patient_id2.send_keys(NON_IDS[0][1])
  page_obj.merge_confirm_btn.click
end

Then('user can not get a merged record of the one and same patient') do
  expect(page_obj.url_include?('mergePatients') && !page_obj.merge_confirm_btn.enabled?).to be(true)
  page_obj.home_btn.click
end

When('user click on the merge patient records by using non-existed patients data') do
  page_obj.data_mng_btn.click
  page_obj.merge_btn.click
  page_obj.merge_confirm_btn.click
  page_obj.patient_id1.send_keys(NON_IDS[1][0])
  page_obj.patient_id2.send_keys(NON_IDS[1][1])
  page_obj.merge_confirm_btn.click
end

Then('user can not get a merged record of the non-existed patients') do
  expect(page_obj.url_include?('mergePatients') && !page_obj.merge_confirm_btn.enabled?).to be(true)
  browser.close()
end
