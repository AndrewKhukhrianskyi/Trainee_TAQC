class Page
  def url_include?(data)
    browser.current_url.include?(data)
  end
end
