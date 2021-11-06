# File, which helps add all gems to the current file
require_relative 'spec_helper'

# Driver initialize (In which browser we do execution tests)
browser = Selenium::WebDriver.for(:firefox)

# :chrome, :firefox

# Test execution process
RSpec.describe 'UI test on the main page' do
  main_pg = MainPage.new

  before(:all) do
    browser.get(MAIN_PAGE)
  end


  after(:all) { browser.close }
  
# UI TESTING (MAIN PAGE)
  context 'UI checking' do

  	it 'verifiies that banner is displayed' do
  		expect(main_pg.banner(browser).displayed?).to be(true)
  	end

  	it 'verifiies that banner text is displayed' do
  		expect(main_pg.banner_text(browser).displayed?).to be(true)
  	end

  	it 'verifiies that banner subtext is displayed' do
  		expect(main_pg.banner_subtext(browser).displayed?).to be(true)
  	end

  	it 'verifiies that search field is displayed' do
  		expect(main_pg.search_field(browser).displayed?).to be(true)
  	end

  	it 'verifiies that submit search button is displayed' do
  		expect(main_pg.submit_search(browser).displayed?).to be(true)
  	end

  	it 'verifiies that posts bar is displayed' do
  		expect(main_pg.posts(browser).displayed?).to be(true)
  	end

  	it 'verifiies that comments bar is displayed' do
  		expect(main_pg.comments(browser).displayed?).to be(true)
  	end

  	it 'verifiies that archives bar is displayed' do
  		expect(main_pg.archives(browser).displayed?).to be(true)
  	end

  	it 'verifiies that categories bar is displayed' do
  		expect(main_pg.categories(browser).displayed?).to be(true)
  	end

  	it 'Vverifiies that meta bar is displayed' do
  		expect(main_pg.meta(browser).displayed?).to be(true)
  	end

  	it 'verifiies that comment date is displayed' do
  		expect(main_pg.entry_meta(browser).displayed?).to be(true)
  	end

  	it 'verifiiesthat comment title is displayed' do
  		expect(main_pg.entry_title(browser).displayed?).to be(true)
  	end

  	it 'Verify that comment is displayed' do
  		expect(main_pg.entry_data(browser).displayed?).to be(true)
  	end

  	it 'Verify that site info on the bottom of the page is displayed' do
  		expect(main_pg.footer(browser).displayed?).to be(true)
  	end
  end

# UI TESTING (COMMENTS & POST PAGE)
  context 'Comments page' do
    it 'verifies that comment field is displayed' do
      main_pg.post_example(browser).click
      expect(main_pg.comment_field(browser).displayed?).to be(true)
    end

    it 'verifiies that name field is displayed' do
      expect(main_pg.author(browser).displayed?).to be(true)
    end

    it 'verifies that email field is displayed' do
      expect(main_pg.website_url(browser).displayed?).to be(true)
    end

    it 'verifies that submit button is displayed' do
      expect(main_pg.submit_btn(browser).displayed?).to be(true)
    end

  end
end
