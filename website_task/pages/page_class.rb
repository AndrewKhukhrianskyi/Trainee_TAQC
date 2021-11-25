class WebPage
  def url_include?(value)
    browser.current_url.include?(value)
  end
  
  def open_log_tab_btn
    browser.find_element(class: "fas fa-chevron-down")
  end

  def reg_link
    browser.find_element(link_text: 'Реєстрація')
  end

  def name_field
    browser.find_element(id: 'input-firstname')
  end

  def surename_field
    browser.find_element(id: 'input-lastname')
  end

  def pwd_field
    browser.find_element(id: 'input-password')
  end

  def email_field
    browser.find_element(id: 'input-email')
  end

  def phone_field
    browser.find_element(id: 'input-telephone')
  end

  def confirm_pwd
    browser.find_element(id: 'input-confirm')
  end

  def reg_btn
    browser.find_element(class: 'register__button')
  end

  def success_title
    browser.find_element(class: 'success__title')
  end

  def reg_process(data)
    open_log_tab_btn.click
    reg_link.click
    reg_widgets = [name_field, surename_field, email_field, pwd_field, confirm_pwd, phone_field]

    for wdg_data in 0..data.length
      reg_widgets[wdg_data].send_keys(data[wdg_data])
    end
  end
end
