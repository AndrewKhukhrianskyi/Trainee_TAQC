# File, which helps add all gems to the current file
require_relative 'spec_helper'


# Test execution process
RSpec.describe 'UI test on the main page' do
  main_pg = MainPage.new

  before(:all) do
    browser.get(MAIN_PAGE)
    main_pg.scroll_down.click
  end

  after(:all) { browser.close }
  context 'Main page' do

    it 'verifies that widgets are displayed' do
      main_pg.widgets.each{|w| expect(w.displayed?).to be(true)}
    end
  end

  context 'Comments page' do
    it 'verifies that widgets are displayed' do
      main_pg.post_example.click
      main_pg.comments_wdg.each{|w| expect(w.displayed?).to be(true)}
    end
  end
end
