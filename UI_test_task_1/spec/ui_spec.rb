# File, which helps add all gems to the current file
require_relative 'spec_helper'

# Test constants
main_pg = MainPage.new


# Test execution process
RSpec.describe 'UI test on the main page' do


  before(:all) do
    browser.get(MAIN_PAGE)
    main_pg.scroll_down.click
    @mass_obj = page_init(main_pg)
    @comments_mass_obj = com_page_init(main_pg)
  end

  after(:all) { browser.close }

  context 'Main page' do
    @mass_obj.each do |widget|
      it 'verifes that current widget is displayed' do
          expect(widget.displayed?).to be(true)
      end
    end
  end

  context 'Comments page' do
    main_pg.post_example.click
    @comments_mass_obj.each do |widget|
      it 'verifies that widgets on the comment page are displayed' do
        expect(widget.displayed?).to be(true)
      end
    end
  end
end
