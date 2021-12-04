class WebPage
  def url_include?(value)
    browser.current_url.include?(value)
  end

  def main_page
    browser.find_element(class: 'main-page-wrapper')
  end

  def wait_for(&block)
    wait = Selenium::WebDriver::Wait.new(timeout: 60, interval: 10)
    wait.until do
      block.call
    end
  end
end
