# File, which helps add all gems to the current file
require_relative 'spec_helper'



# Test execution process
RSpec.describe 'UI test on the main page' do

  main_pg = MainPage.new


  before(:all) do
    browser.get(MAIN_PAGE)
    #start(main_pg)
  end


  after(:all) { browser.close }
  context 'UI checking' do
# UI TESTING
  	it 'verifiies that banner is displayed' do
  		expect(main_pg.banner.displayed?).to be(true)
  	end

  	it 'verifiies that banner text is displayed' do
  		expect(main_pg.banner_text.displayed?).to be(true)
  	end

  	it 'verifiies that banner subtext is displayed' do
  		expect(main_pg.banner_subtext.displayed?).to be(true)
  	end

  	it 'verifiies that search field is displayed' do
  		expect(main_pg.search_field.displayed?).to be(true)
  	end

  	it 'verifiies that submit search button is displayed' do
  		expect(main_pg.submit_search.displayed?).to be(true)
  	end

  	it 'verifiies that posts bar is displayed' do
  		expect(main_pg.posts.displayed?).to be(true)
  	end

  	it 'verifiies that comments bar is displayed' do
  		expect(main_pg.comments.displayed?).to be(true)
  	end

  	it 'verifiies that archives bar is displayed' do
  		expect(main_pg.archives.displayed?).to be(true)
  	end

  	it 'verifiies that categories bar is displayed' do
  		expect(main_pg.categories.displayed?).to be(true)
  	end

  	it 'Vverifiies that meta bar is displayed' do
  		expect(main_pg.meta.displayed?).to be(true)
  	end

  	it 'verifiies that comment date is displayed' do
  		expect(main_pg.entry_meta.displayed?).to be(true)
  	end

  	it 'verifiiesthat comment title is displayed' do
  		expect(main_pg.entry_title.displayed?).to be(true)
  	end

  	it 'verifies that comment is displayed' do
  		expect(main_pg.entry_data.displayed?).to be(true)
  	end

  	it 'Verify that site info on the bottom of the page is displayed' do
  		expect(main_pg.footer.displayed?).to be(true)
  	end
  end

  context 'Comments page' do
    it 'verifies that comment field is displayed' do
      main_pg.post_example.click
      expect(main_pg.comment_field.displayed?).to be(true)
    end

    it 'verifiies that name field is displayed' do
      expect(main_pg.author.displayed?).to be(true)
    end

    it 'verifies that email field is displayed' do
      expect(main_pg.website_url.displayed?).to be(true)
    end

    it 'verifies that submit button is displayed' do
      expect(main_pg.submit_btn.displayed?).to be(true)
    end

  end
end
