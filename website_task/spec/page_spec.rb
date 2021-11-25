require_relative 'spec_helper'

web_pg = WebPage.new

RSpec.describe('Webpage testing') do
  before(:all) do
    browser.get(MAIN_PAGE)
  end

  after(:all) do
    browser.close()
  end

  context('Webpage testing') do
    it 'verifies that user can create a new account' do
      web_pg.open_log_tab_btn.click
      expect(web_pg.success_title.displayed? && web_pg.url_include?('success')).to be(true)
    end
  end
end
