require_relative 'spec_helper'

web_pg = WebPage.new

RSpec.describe('Webpage testing') do
  before(:all) do
    browser.get(MAIN_PAGE)
  end

  after(:all) do
    browser.close()
  end
  context 'Functional testing' do
    xit 'verifies that user can register a new account' do
        web_pg.reg_process(TEXT)
        expect(web_pg.success_message.text) == 'Спасибо за регистрацию!'
    end

    it 'verifies that searchable items on the page is displayed' do
      web_pg.item_tab.click
      web_pg.item_box.click
      expect(web_pg.url_include?('maxpedition')).to be(true)
    end

    it 'verifies that user can add item to the cart' do
      web_pg.item.click
      web_pg.buy_btn.click
      expect(web_pg.cart_tab.dispayed? && web_pg.cart_tab_item.displayed?).to be(true)
    end
  end
end
