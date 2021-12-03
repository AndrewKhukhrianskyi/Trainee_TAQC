class HomePage
  def home_btn
    browser.find_element(xpath: '//ul/li/a/i[@class="icon-home small"]')
  end

  def home_nav_btn
    browser.find_task(id: 'homeNavLink')
  end
end
