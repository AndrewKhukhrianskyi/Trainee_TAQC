# Add config file to the project
require_relative 'config'

# Constants
page_obj = Page.new
login_obj = LoginPage.new
home_obj = HomePage.new
merge_obj = MergePage.new
sys_obj = SystemPage.new
reg_patient_obj = RegisterPage.new
patient_info_obj = PatientPage.new
# Test execution
browser.get(MAIN_PAGE)
login_obj.login('admin', 'Admin123')



When('opening patient page') do
  patient_info_obj.find_patient_btn.click
end

Then('patient table is not empty') do
  expect(patient_info_obj.columm_id.text.empty? && patient_info_obj.column_name.text.empty? && patient_info_obj.column_gender.text.empty? && patient_info_obj.column_age.text.empty? && patient_info_obj.column_date.text.empty?).to be(false)
  home_obj.home_btn.click
end


When('user fills all fields on patient register page') do
  reg_patient_obj.reg_btn.click

  reg_patient_obj.name.send_keys(PATIENT_DATE[0]) # name
  reg_patient_obj.middle_name.send_keys(PATIENT_DATE[1]) # Middle name
  reg_patient_obj.surename.send_keys(PATIENT_DATE[2]) # Surename

  reg_patient_obj.nxt_btn.click

  # Gender page
  reg_patient_obj.gender(GENDER[0]).click
  reg_patient_obj.right_nxt_btn.click

  # Date page
  reg_patient_obj.day.send_keys(PATIENT_DATE[3]) # day
  reg_patient_obj.month.click
  reg_patient_obj.month.click # month
  reg_patient_obj.month_set(MONTHS[1]).click # month

  reg_patient_obj.year.send_keys(PATIENT_DATE[4]) # year
  reg_patient_obj.right_nxt_btn.click

  # Address
  reg_patient_obj.address.send_keys(PATIENT_DATE[5])
  reg_patient_obj.right_nxt_btn.click

  # Phone
  reg_patient_obj.phone.send_keys(PATIENT_DATE[6])
  binding.pry
  reg_patient_obj.right_nxt_btn.click

  # skip relationships
  reg_patient_obj.right_nxt_btn.click
  reg_patient_obj.submit_btn.click

  @patient_id = patient_info_obj.patient_id_icon.text
  home_obj.home_btn.click
end


Then('new patient is created') do
  patient_info_obj.find_patient_btn.click
  res = [@patient_id].concat(PATIENT_SHORT_INFO)
  expect(patient_info_obj.columm_id.text.include?(res[0]) && patient_info_obj.column_name.text.include?(res[1]) && patient_info_obj.column_gender.text.include?(res[2]) && patient_info_obj.column_age.text.include?(res[3]) && patient_info_obj.column_date.text.include?(res[4]))
  home_obj.home_btn.click
end

When('register patient is opened and all data fields are filled') do
  reg_patient_obj.reg_btn.click

  reg_patient_obj.name.send_keys(PATIENT_DATE[0]) # name
  reg_patient_obj.middle_name.send_keys(PATIENT_DATE[1]) # Middle name
  reg_patient_obj.surename.send_keys(PATIENT_DATE[2]) # Surename

  reg_patient_obj.nxt_btn.click

  reg_patient_obj.gender(GENDER[0]).click
  reg_patient_obj.right_nxt_btn.click

  reg_patient_obj.day.send_keys(PATIENT_DATE[3]) # day
  reg_patient_obj.month.click
  reg_patient_obj.month.click # month
  reg_patient_obj.month_set(MONTHS[1]).click # month

  reg_patient_obj.year.send_keys(PATIENT_DATE[4]) # year
  reg_patient_obj.right_nxt_btn.click

  reg_patient_obj.address.send_keys(PATIENT_DATE[5])
  reg_patient_obj.right_nxt_btn.click

  reg_patient_obj.phone.send_keys(PATIENT_DATE[6])
  reg_patient_obj.right_nxt_btn.click

  reg_patient_obj.right_nxt_btn.click
end

Then('user can get an information bar about existing patient') do
  expect(reg_patient_obj.similar_patient_bar.displayed?).to be(true)
  home_obj.home_btn.click
end


# Bug - non-interactable elements
=begin
When('user click on the add task page and fill all fields by using valid data') do
  browser.get(ADMIN_PAGE)
  sys_obj.task_name_field.send_keys('Auto Close Visits Task')
  sys_obj.subtitle_field.send_keys('org.openmrs.scheduler.tasks.AutoCloseVisitsTask')
  sys_obj.save_btn.click
end

Then('user can see added tasks on the page') do
  expect(sys_obj.find_task('Auto Close Visits Task').displayed?).to be(true)
  home_obj.home_nav_btn.click
=end

# This test depends from test data to work (In some cases, test can not be executable because some patient IDs are not exist)
=begin
When('user click on the merge patient records') do
  merge_obj.data_mng_btn.click
  merge_obj.merge_btn.click
  merge_obj.patient_id1.send_keys('100J8U') # First patient
  merge_obj.patient_id2.send_keys('100HM1') # Second patient
  merge_obj.merge_confirm_btn.click
  merge_obj.merge_confirm_btn.click
  merge_obj.merge_patient.click
  merge_obj.merge_confirm_btn.click
end


Then('user can get a merged record') do
  expect(merge_obj.expected_id1.text.include?('1003HP') && merge_obj.expected_id2.text.include?('100HM1')).to be(true)
  home_obj.home_btn.click
=end

# Negative tests merging
# Non-existed patient & Patient with the same ID

When('user click on the merge patient records by using one and the same patient data') do
  merge_obj.data_mng_btn.click
  merge_obj.merge_btn.click
  merge_obj.merge_confirm_btn.click
  merge_obj.patient_id1.send_keys(NON_IDS[0][0])
  merge_obj.patient_id2.send_keys(NON_IDS[0][1])
  merge_obj.merge_confirm_btn.click
end

Then('user can not get a merged record of the one and same patient') do
  expect(page_obj.url_include?('mergePatients') && !merge_obj.merge_confirm_btn.enabled?).to be(true)
  home_obj.home_btn.click
end

When('user click on the merge patient records by using non-existed patients data') do
  merge_obj.data_mng_btn.click
  merge_obj.merge_btn.click
  merge_obj.merge_confirm_btn.click
  merge_obj.patient_id1.send_keys(NON_IDS[1][0])
  merge_obj.patient_id2.send_keys(NON_IDS[1][1])
  merge_obj.merge_confirm_btn.click
end

Then('user can not get a merged record of the non-existed patients') do
  expect(page_obj.url_include?('mergePatients') && !merge_obj.merge_confirm_btn.enabled?).to be(true)
  browser.close()
end
