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

  context 'Main page' do
    page_init(main_pg).each do |widget_name, widget|
        it "verifies that element #{widget_name} is displayed" do
          expect(widget.displayed?).to be(true)
        end
    end
  end

  context 'Comments page' do
    main_pg.post_example.click
      com_page_init(main_pg).each do |widget_name, widget|
        it "verifies that element #{widget_name} is displayed" do
          expect(widget.displayed?).to be(true)
      end
    end
  end
end
