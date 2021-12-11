class CartPage
  def cart_icon
    browser.find_element(class: 'woodmart-cart-icon')
  end

  def cart_list
    browser.find_element(class: "woocommerce-mini-cart-item")
  end

  def cart_item
    browser.find_element(class: 'mini_cart_item')
  end

  def cart_tab
    browser.find_element(class: 'widget_shopping_cart_content')
  end

  def empty_cart_title
    browser.find_element(xpath: "//div/div/p[contains(text(), 'Немає товарів у кошику.')]")
  end

  def close_cart_tab
    browser.find_element(xpath: "//div[@class='wd-close-side woodmart-close-side wd-close-side-opened']")
  end
end
