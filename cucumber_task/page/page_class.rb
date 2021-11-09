class Page
  def url_include?(data)
    browser.current_url.include?(data)
  end

  # ATTENTION - UNSECURE (Login and pasword can be send without any encryption)
  def login(username, pwd)
    browser.find_element(id: 'username').send_keys(usename)
    browser.find_element(id: 'password').send_keys(pwd)
    browser.find_element(id: 'Inpatient Ward').click()
    browser.find_element(id: 'loginButton').click()
  end

  def find_patient_btn
    browser.find_element(id: 'coreapps-activeVisitsHomepageLink-coreapps-activeVisitsHomepageLink-extension')
  end

  def columm(data)
    browser.find_element(name: data)
  end

  def reg_btn
    browser.find_element(id: 'registrationapp-basicRegisterPatient-homepageLink-registrationapp-basicRegisterPatient-homepageLink-extension')
  end

  def name
    browser.find_element(id: 'fr8399-field')
  end

  def middle_name
    browser.find_element(id: 'fr6602-field')
  end

  def surename
    browser.find_element(id: 'fr6602-field')
  end

  def gender(sex) # Male or Female
    browser.find_element(name: sex)
  end

  def nxt_btn
    browser.find_element(id: 'next-button')
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

  def reg_process(patient_fullname, patient_birthdate, gndr, m):
    # Full name page
    reg_btn.click
    name.send_keys(patient_fullname[0]) # name
    middle_name.send_keys(patient_fullname[1]) # Middle name
    surename.send_keys(patient_fullname[2]) # Surename
    nxt_btn.click
    # Gender page
    gender(gndr[0]).click
    nxt_btn.click
    # Date page
    day.send_keys(patient_birthdate[0]) # day
    month(m[0]).click # month
    month_set.click
    year.send_keys(patient_birthdate[1]) # year
    nxt_btn.click

    submit_btn.click
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

  def patient_id
    arr_id = [browser.find_element(id: 'patient1-text'),
              browser.find_element(id: 'patient2-text')]
    arr_id
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
