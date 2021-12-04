require_relative 'spec_helper'

web_pg = WebPage.new
items_pg = ItemsPage.new
cart_pg = CartPage.new
search_pg = SearchPage.new


RSpec.describe('Webpage testing') do
  before(:all) do
    browser.get(MAIN_PAGE)
  end

  after(:all) do
    browser.close()
  end

  context('Webpage testing') do
    it 'verifies that webpage is displayed' do
      expect(web_pg.main_page.displayed?).to be(true)
    end

    it 'verifies that user can open item list' do
      items_pg.item_panel.click
      items_pg.subitem_category.click
      expect(web_pg.url_include?('product-category') && items_pg.choose_item.displayed?).to be(true)
    end

    it 'verifies that user can add items to the cart' do
      items_pg.choose_item.click
      items_pg.item_char.click
      items_pg.item_char_set.click
      items_pg.add_to_cart_btn.click
      # Работет но нужно время на обработку запроса (пауза нужна)
      cart_pg.cart_icon.click
      web_pg.wait_for(cart_pg.empty_cart_title.displayed?).to be(false)
      expect(cart_pg.cart_item.displayed?).to be(true)
    end

    it 'verifies that user can delete item from cart' do
      cart_pg.remove_item_btn.click
      web_pg.wait_for(cart_pg.remove_item_btn.displayed?).to be(false)
      expect(cart_pg.empty_cart_title.displayed?).to be(true)
    end

    it 'verifies that user can find item by using valid data' do
      search_pg.search_field.send_keys(VALID_DATA)
      search_pg.search_icon.click
      expect(search_pg.no_results.displayed?).to be(false)
    end

    it 'verifies that user can find item by using invalid data' do
      search_pg.search_field.send_keys(INVALID_DATA)
      search_pg.search_icon.click
      expect(search_pg.no_results.displayed?).to be(true)
    end

    it ('verifies that user can not get access by using hacker features') do
      SECURITY_TEST_DATA.each do |data|
        search_pg.search_field.send_keys(data)
        expect(search_pg.no_results.displayed?).to be(true)
      end
    end
  end
end
