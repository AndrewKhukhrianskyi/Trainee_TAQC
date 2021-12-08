# File, which helps add all gems to the current file
require_relative 'spec_helper'

# Test constants
main_pg = MainPage.new

# Test execution process
RSpec.describe 'UI test on the main page' do
  before(:all) do
    browser.get(MAIN_PAGE)
    main_pg.scroll_down.click
  end

  after(:all) { browser.close }

  context 'Main page & Comments page' do
    it "verifies that element all widgets are displayed on the main page" do
        main_pg.page_init(main_pg).each do |widget_name, widget|
            expect(widget.displayed?).to be(true)
        end
    end

    it "verifies that element all widgets are displayed on the comments page" do
      main_pg.post_example.click
      main_pg.com_page_init(main_pg).each do |widget_name, widget|
          expect(widget.displayed?).to be(true)
      end
    end
  end
end
