require_relative 'spec_helper'

browser = Selenium::WebDriver.for(:firefox)

RSpec.describe 'Active page elements' do
  main_pg = MainPage.new

  before(:each) do
    browser.get(MAIN_PAGE)
    main_pg.scroll_down(browser).click
  end


  after(:all) { browser.close }

  # Positive testing

  it 'verifies that user can not find unexisted info' do
    main_pg.enter_data(browser, INVALID_DATA)
    main_pg.submit_search(browser).click
    expect(main_pg.posts(browser).text) == 'Nothing Found'
  end

  it 'verifies that user can find existed info' do
    main_pg.enter_data(browser, VALID_DATA)
    main_pg.submit_search(browser).click
    expect(main_pg.posts(browser).text) == 'Search Results for: ' + VALID_DATA
  end

  it 'verifies that user can read existed data' do
    main_pg.posts(browser).click
    expect(main_pg.url_include?(browser, VALID_DATA))
  end

  it 'verifies that user can go to the selected post' do
    main_pg.post_example(browser)
    expect(main_pg.url_include?(browser, 'hello-world'))
  end

  it 'verifies that user can go to the wordpress commenter page' do
    main_pg.comment(browser).click
    expect(main_pg.url_include?(browser, 'wordpress'))
  end

  it 'verifies that user can go to the archives page' do
    main_pg.archive_date(browser).click
    expect(main_pg.url_include?(browser, '2018/10'))
  end

  it 'verifies that user can go to the categories page' do
    main_pg.log_in(browser).click
    expect(main_pg.url_include?(browser, 'uncategorized'))
  end

  it 'verifies that user can go to the login page' do
    main_pg.log_in(browser).click
    expect(main_pg.url_include?(browser, 'log in'))
  end

  it 'verifies that user can go to the entries feed' do
    main_pg.entries_feed(browser).click
    expect(main_pg.url_include?(browser, 'feed'))
  end

  it 'verifies that user can go to the comments feed' do
    main_pg.comments_feed(browser).click
    expect(main_pg.url_include?(browser, 'feed'))
  end

  it 'verifies that user can go to the wordpress website' do
    main_pg.wordpress(browser).click
    expect(main_pg.url_include?(browser, 'wordpress'))
  end
end
