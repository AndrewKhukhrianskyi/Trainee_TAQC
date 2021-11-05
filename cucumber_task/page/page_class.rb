class Page
  def url_include?(data)
    browser.current_url.include?(data)
  end

  # ATTENTION - UNSECURED
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

  def gender
    browser.find_element(name: 'Male')
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

  def month_set
    browser.find_element(name: 'January')
  end

  def year
    browser.find_element(id: 'birthdateYear-field')
  end

  def submit_btn
    browser.find_element(id: 'submit')
  end

  def reg_process(patient_fullname, patient_birthdate):
    # Full name page
    reg_btn.click
    name.send_keys(patient_fullname[0]) # name
    middle_name.send_keys(patient_fullname[1]) # Middle name
    surename.send_keys(patient_fullname[2]) # Surename
    nxt_btn.click
    # Gender page
    gender.click
    nxt_btn.click
    # Date page
    day.send_keys(patient_birthdate[0]) # day
    month.click
    month_set.click
    year.send_keys(patient_birthdate[1]) # year
    nxt_btn.click

    submit_btn.click
  end




end
