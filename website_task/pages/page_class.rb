class WebPage
  def url_include?(value)
    browser.current_url.include?(value)
  end

  def shop_login_btn
    browser.find_element(xpath: '//div/div/a[@href="https://reloading.com.ua/auth"]')
  end

  def reg_btn
    browser.find_element(class: 'form__link')
  end

  def name
    browser.find_element(xpath: '//div/div[@name = "username"]')
  end

  def email
    browser.find_element(xpath: '//div/div[@name = "email"]')
  end

  def city
    browser.find_element(xpath: '//div/div[@name = "custom_field[123]"')
  end

  def pwd
    browser.find_element(xpath: '//div/div[@name = "password"')
  end

  def confirm_pwd
    browser.find_element(xpath: '//div/div[@name = "confirm_password"')
  end

  def reg_confirm_btn
    browser.find_element(class: 'btn btn-primary')
  end

  def success_message
    browser.find_element(class: 'content__title')
  end

  def reg_process(data)
    shop_login_btn.click
    reg_btn.click
    data_fields = [name, email, city, pwd, confirm_pwd]

    for text in 0..data_fields.length - 1
      data_fields[text].send_keys(data[text])
    end

    reg_confirm_btn.click
  end

  def item_tab
    browser.find_element(xpath: '//ul[@class="main-nav__items"]/li/a[@href="https://reloading.com.ua/maxpedition"]]')
  end

  def item_box
    browser.find_element(text: 'Тактические рюкзаки')
  end

  def item
    browser.find_element(link_text: 'Рюкзак Maxpedition FALCON-II')
  end

  def buy_btn
    browser.find_element(class: 'btn btn-primary btn-lg')
  end

  def cart_tab
    browser.find_element(text: 'Моя корзина')
  end

  def cart_tab_item
    browser.find_element(class: 'cart-product')
  end
end
