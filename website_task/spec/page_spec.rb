require_relative 'spec_helper'

web_pg = WebPage.new
items_pg = ItemsPage.new
cart_pg = CartPage.new


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
      # Тут надо покумекать
      cart_pg.cart_icon.click
      expect(cart_pg.empty_cart_title.displayed?).to be(false)
    end

    it 'verifies that user can delete item from cart' do
      cart_pg.remove_item_btn.click
      expect(cart_pg.empty_cart_title.displayed?).to be(true)
    end
  end
end
