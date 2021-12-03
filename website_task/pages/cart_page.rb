class CartPage
  def cart_icon
    browser.find_element(class: 'woodmart-cart-icon')
  end

  def cart_list
    browser.find_element(class: "woocommerce-mini-cart-item")
  end

  def empty_cart_title
    browser.find_element(xpath: "//div/div/p[contains(text(), 'Немає товарів у кошику.')]")
  end

  def remove_item_btn
    browser.find_element(class: 'remove_from_cart_button')
  end

  def close_cart_btn
    browser.find_element(class: 'close-side-widget wd-action-btn wd-style-text wd-cross-icon')
  end
end
