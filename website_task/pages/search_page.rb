class SearchPage
  def search_field
    browser.find_element(class: 'wd-search-inited')
  end

  def search_icon
    browser.find_element(class: 'searchsubmit')
  end

  def no_results
    browser.find_element(class: 'woocommerce-info')
  end
end
