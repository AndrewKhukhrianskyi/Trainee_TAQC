class Page
  def url_include?(data)
    browser.current_url.include?(data)
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
    browser.find_element(id: 'rreferenceapplication-registrationapp-registerPatient-homepageLink-referenceapplication-registrationapp-registerPatient-homepageLink-extension')
  end

  def name
    browser.find_element(id: 'fr8105-field')
  end

  def middle_name
    browser.find_element(id: 'fr5134-field')
  end

  def surename
    browser.find_element(id: 'fr7202-field')
  end

  def gender(sex) # Male or Female
    browser.find_element(name: sex)
  end

  def nxt_btn
    browser.find_element(id: 'next-button')
  end

  def right_nxt_btn
    browser.find_element(class: 'confirm right')
  end

  def day
    browser.find_element(id: 'birthdateDay-field')
  end

  def month
    browser.find_element(id: 'birthdateMonth-field')
  end

  def month_set(mnth)
    browser.find_element(name: mnth)
  end

  def year
    browser.find_element(id: 'birthdateYear-field')
  end

  def submit_btn
    browser.find_element(id: 'submit')
  end

  def address
    browser.find_element(id: 'address1')
  end

  def phone
    browser.find_element(id: 'fr7772-field')
  end

  def reg_process(data_list, mnths, gndr)
    # Full name page
    reg_btn.click
    name.send_keys(data_list[0]) # name
    middle_name.send_keys(data_list[1]) # Middle name
    surename.send_keys(data_list[2]) # Surename
    nxt_btn.click
    # Gender page
    gender(gndr[0]).click
    right_nxt_btn.click
    # Date page
    day.send_keys(data_list[3]) # day
    month.click # month
    month_set(mnths[0]).click
    year.send_keys(data_list[4]) # year
    right_nxt_btn.click
    # Address
    address.send_keys(data_list[5])
    right_nxt_btn.click
    # Phone
    phone.send_keys(data_list[6])
    right_nxt_btn.click
    #skip relationships
    right_nxt_btn.click
    submit_btn.click
  end

  def patient_id_icon
    browser.find_element(xpath: "div/em/span[contains(text(), '100')]")
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
    browser.find_element(link_text: 'Add Task')
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

  def home_btn
    browser.find_element(class: 'icon-home small')
  end
end
