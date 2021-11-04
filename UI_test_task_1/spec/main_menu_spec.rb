require_relative 'spec_helper'

RSpec.describe 'Active page elements' do
  main_pg = MainPage.new

  before(:each) do
    browser.get(MAIN_PAGE)
    main_pg.scroll_down.click
  end


  after(:all) { browser.close }

  # Positive testing

  it 'verifies that user can not find unexisted info' do
    main_pg.enter_data(browser, INVALID_DATA)
    main_pg.submit_search.click
    expect(main_pg.posts.text) == 'Nothing Found'
  end

  it 'verifies that user can find existed info' do
    main_pg.enter_data(browser, VALID_DATA)
    main_pg.submit_search.click
    expect(main_pg.posts.text) == 'Search Results for: ' + VALID_DATA
  end

  it 'verifies that user can read existed data' do
    main_pg.posts.click
    expect(main_pg.url_include?(VALID_DATA))
  end

  it 'verifies that user can go to the selected post' do
    main_pg.post_example
    expect(main_pg.url_include?('hello-world'))
  end

  it 'verifies that user can go to the wordpress commenter page' do
    main_pg.comment.click
    expect(main_pg.url_include?('wordpress'))
  end

  it 'verifies that user can go to the archives page' do
    main_pg.archive_date.click
    expect(main_pg.url_include?('2018/10'))
  end

  it 'verifies that user can go to the categories page' do
    main_pg.log_in.click
    expect(main_pg.url_include?('uncategorized'))
  end

  it 'verifies that user can go to the login page' do
    main_pg.log_in.click
    expect(main_pg.url_include?('log in'))
  end

  it 'verifies that user can go to the entries feed' do
    main_pg.entries_feed.click
    expect(main_pg.url_include?('feed'))
  end

  it 'verifies that user can go to the comments feed' do
    main_pg.comments_feed.click
    expect(main_pg.url_include?('feed'))
  end

  it 'verifies that user can go to the wordpress website' do
    main_pg.wordpress.click
    expect(main_pg.url_include?('wordpress'))
  end
end
