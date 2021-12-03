class MergePage
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
