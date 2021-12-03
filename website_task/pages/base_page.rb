class WebPage
  def url_include?(value)
    browser.current_url.include?(value)
  end

  def main_page
    browser.find_element(class: 'main-page-wrapper')
  end
end
