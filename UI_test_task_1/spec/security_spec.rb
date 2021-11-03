require_relative 'spec_helper'

browser = Selenium::WebDriver.for(:firefox)


RSpec.describe 'Security tests' do
  main_pg = MainPage.new

  before(:each) do
    browser.get(MAIN_PAGE)
  end

  after(:all) { browser.close }

  context 'Security testing' do
    it 'verifies that user can not get access to the website by using SQL injections' do
      main_pg.enter_data(browser, 'SELECT * FROM table')
      main_pg.submit_search(browser).click
      expect(main_pg.posts(browser).text) == 'Nothing Found'
    end

    it 'verifies that user can not get access to the website by using XSS' do
      main_pg.enter_data(browser, '<img src="http://url.to.file.which/not.exist" onerror=alert(document.cookie);>')
      main_pg.submit_search(browser).click
      expect(main_pg.posts(browser).text) == 'Nothing Found'
    end
  end
end
