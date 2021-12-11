class ItemsPage
  def item_panel
    browser.find_element(xpath: '//div/div/a/img[@alt="фан-арт"]')
  end

  def subitem_category
    browser.find_element(xpath: '//div/div/a/img[@alt="Світ Гаррі Поттера"]')
  end

  def choose_item
    browser.find_element(xpath: '//div/div/h3')
  end

  def add_to_cart_btn
    browser.find_element(class: 'single_add_to_cart_button')
  end

  def item_char
    browser.find_element(id: 'forma-termochashky')
  end

  def item_char_set
    browser.find_element(xpath: '//td/select/option[2]')
  end
end
