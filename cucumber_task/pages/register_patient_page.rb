class RegisterPage
  def reg_btn
    browser.find_element(xpath: '//div/div/a[3]')
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

  def similar_patient_bar
    browser.find_element(xpath: '//div/div[@id="similarPatients"]')
  end
end
