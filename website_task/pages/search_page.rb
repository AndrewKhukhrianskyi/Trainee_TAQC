class SearchPage
  def search_field
    browser.find_element(xpath: '//div/form/input[@class="s"]')
  end

  def search_icon
    browser.find_element(class: 'searchsubmit')
  end

  def no_results
    browser.find_element(xpath: "//div/div/p[@class='woocommerce-info']")
  end

  def search_element
    browser.find_element(xpath: "//div/div/a[@class='product-image-link']")
  end
end
