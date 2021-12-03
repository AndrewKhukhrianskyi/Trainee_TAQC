class LoginPage
  def login(username, pwd)
    browser.find_element(id: 'username').send_keys(username)
    browser.find_element(id: 'password').send_keys(pwd)
    browser.find_element(xpath: '//ul/li[1]').click()
    browser.find_element(id: 'loginButton').click()
  end
end
