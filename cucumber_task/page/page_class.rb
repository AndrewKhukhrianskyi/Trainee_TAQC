class Page
  def url_include?(data)
    browser.current_url.include?(data)
  end

  def home_btn
    browser.find_element(xpath: '//ul/li/a/i[@class="icon-home small"]')
  end

  def home_nav_btn
    browser.find_task(id: 'homeNavLink')
  end

  # ATTENTION - UNSECURE (Login and pasword can be send without any encryption)
  def login(username, pwd)
    browser.find_element(id: 'username').send_keys(username)
    browser.find_element(id: 'password').send_keys(pwd)
    browser.find_element(xpath: '//ul/li[1]').click()
    browser.find_element(id: 'loginButton').click()
  end

  def find_patient_btn
    browser.find_element(id: 'coreapps-activeVisitsHomepageLink-coreapps-activeVisitsHomepageLink-extension')
  end

  def columm_id
    browser.find_element(xpath: '//tr[1]/td[1]')
  end

  def column_name
    browser.find_element(xpath: '//tr[1]/td[2]')
  end

  def column_gender
    browser.find_element(xpath: '//tr[1]/td[3]')
  end

  def column_age
    browser.find_element(xpath: '//tr[1]/td[4]')
  end

  def column_date
    browser.find_element(xpath: '//tr[1]/td[5]')
  end

  def column_arr
    cols = [column_id, column_name, column_gender, column_age, column_date]
  end

  def reg_btn
    browser.find_element(xpath: '//div/div/a[4]')
  end

  def name
    browser.find_element(xpath: '//div/p/input[@name="givenName"]')
  end

  def middle_name
    browser.find_element(xpath: '//div/p/input[@name="middleName"]')
  end

  def surename
    browser.find_element(xpath: '//div/p/input[@name="familyName"]')
  end

  def gender(sex) # Male or Female
    browser.find_element(xpath: '//select/option[@value="M"]')
  end

  def nxt_btn
    browser.find_element(id: 'next-button')
  end

  def right_nxt_btn
    browser.find_element(xpath: "//div/button[@id='next-button']")
  end

  def day
    browser.find_element(xpath: "//p/input[@id='birthdateDay-field']")
  end

  def month
    browser.find_element(xpath: "//p/select[@id='birthdateMonth-field']")
  end

  def month_set(month_value)
    browser.find_element(xpath: "//p/select/option[@value=#{month_value}]")
  end

  def year
    browser.find_element(id: 'birthdateYear-field')
  end

  def submit_btn
    browser.find_element(id: 'submit')
  end

  def relatives
    browser.find_element(xpath:'//p/select[@id=relationship_type]')
  end

  def relatives_set
    browser.find_element(xpath:'//select/option[@value = "8d919b58-c2cc-11de-8d13-0010c6dffd0f-B"]')
  end

  def address
    browser.find_element(xpath: '//p/input[@id = "address1"]')
  end

  def phone
    browser.find_element(xpath: '//p/input[@name = "phoneNumber"]')
  end

  def reg_process(page_obj, data_list, mnths, gndr)
    # Full name page
    page_obj.reg_btn.click
    page_obj.name.send_keys(data_list[0]) # name
    page_obj.middle_name.send_keys(data_list[1]) # Middle name
    page_obj.surename.send_keys(data_list[2]) # Surename
    page_obj.nxt_btn.click
    # Gender page
    page_obj.gender(gndr[0]).click
    page_obj.right_nxt_btn.click
    # Date page
    page_obj.day.send_keys(data_list[3]) # day
    page_obj.month.click # month
    page_obj.month_set(mnths[0]).click
    page_obj.year.send_keys(data_list[4]) # year
    page_obj.right_nxt_btn.click
    # Address
    page_obj.address.send_keys(data_list[5])
    page_obj.right_nxt_btn.click
    # Phone
    page_obj.phone.send_keys(data_list[6])
    page_obj.right_nxt_btn.click
    #skip relationships
    page_obj.right_nxt_btn.click
    page_obj.submit_btn.click
  end

  def patient_id_icon
    browser.find_element(xpath: "//div/span[contains(text(), '100')]")
  end

  def admin_btn
    browser.find_element(id: 'coreapps-systemadministration-homepageLink-coreapps-systemadministration-homepageLink-extension')
  end

  def adv_btn
    browser.find_element(id: 'referenceapplication-legacyAdmin-app')
  end

  def scheduler
    browser.find_element(link_text: 'Manage Scheduler')
  end

  def add_task
    browser.find_element(xpath: "//div/a[text()='Add Task']")
  end

  def task_name_field
    browser.find_element(xpath: '//form/fieldset/table/tbody/tr[2]/td[2]')
  end

  def subtitle_field
    browser.find_element(xpath: '//form/fieldset/table/tbody/tr[3]/td[2]')
  end

  def save_btn
    browser.find_element(text: 'Save')
  end

  def find_task(data)
    browser.find_element(link_text: data)
  end

  def data_mng_btn
    browser.find_element(id: 'coreapps-datamanagement-homepageLink-coreapps-datamanagement-homepageLink-extension')
  end

  def merge_btn
    browser.find_element(id: 'coreapps-mergePatientsHomepageLink-app')
  end

  def patient_id1
    browser.find_element(id: 'patient1-text')
  end

  def patient_id2
    browser.find_element(id: 'patient2-text')
  end

  def merge_confirm_btn
    browser.find_element(id: 'confirm-button')
  end

  def merge_patient
    browser.find_element(id: 'second-patient')
  end

  def expected_id1
    browser.find_element(xpath: "//div/span[text() ='1003HP']")
  end

  def expected_id2
    browser.find_element(xpath: "//div/span[text() ='100HM1']")
  end
end
