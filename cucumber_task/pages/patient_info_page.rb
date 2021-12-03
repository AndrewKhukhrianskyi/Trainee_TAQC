class PatientPage
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

  def patient_id_icon
    browser.find_element(xpath: "//div/span[contains(text(), '100')]")
  end

end
