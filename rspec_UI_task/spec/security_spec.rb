require_relative 'spec_helper'


RSpec.describe 'Security tests' do
  main_pg = MainPage.new

  before(:all) do
    browser.get(MAIN_PAGE)
    main_pg.scroll_down
  end

  after(:all) { browser.close }

  context 'Security testing' do
    it 'verifies that user can not get access to the website by using SQL injections' do
      main_pg.enter_data('SELECT * FROM table')
      main_pg.submit_search.click
      expect(main_pg.posts.text) == 'Nothing Found'
    end

    it 'verifies that user can not get access to the website by using XSS' do
      main_pg.search_field.clear
      main_pg.enter_data('<img src="http://url.to.file.which/not.exist" onerror=alert(document.cookie);>')
      main_pg.submit_search.click
      expect(main_pg.posts.text) == 'Nothing Found'
    end
  end
end
