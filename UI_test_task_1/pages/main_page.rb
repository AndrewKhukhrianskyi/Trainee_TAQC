class MainPage
  def url_include?(browser, data)
    browser.current_url.include?(data)
  end

  def banner(browser)
    browser.find_element(class: 'site-header')
  end

  def banner_text(browser)
    browser.find_element(class: 'site-title')
  end

  def banner_subtext(browser)
    browser.find_element(class: 'site-description')
  end

  def search_field(browser)
    browser.find_element(class: 'search-field')
  end

  def scroll_down(browser)
    browser.find_element(class: 'menu-scroll-down')
  end

  def enter_data(browser, data)
    search_field(browser).send_keys(data)
  end

  def submit_search(browser)
    browser.find_element(class: 'search-submit')
  end

  def posts_recent(browser)
    browser.find_element(id: 'recent-posts-2')
  end

  def comments(browser)
    browser.find_element(id: 'recent-comments-2')
  end

  def archives(browser)
    browser.find_element(id: 'archives-2')
  end

  def categories(browser)
    browser.find_element(id: 'categories-2')
  end

  def meta(browser)
    browser.find_element(id: 'meta-2')
  end

  def posts(browser)
    browser.find_element(class: 'page-title')
  end

  def entry_meta(browser)
    browser.find_element(class: 'entry-meta')
  end

  def entry_title(browser)
    browser.find_element(class: 'entry-title')
  end

  def title_by_name(browser, data)
    browser.find_element(name: data)
  end

  def posts_button(browser)
    browser.find_element(class: 'more_link')
  end

  def entry_data(browser)
    browser.find_element(class: 'entry-content')
  end

  def footer(browser)
    browser.find_element(class: 'site-info')
  end

  def post_example(browser)
    browser.find_element(link_text: 'Hello world!')
  end

  def comment(browser)
    browser.find_element(link_text: 'A WordPress Commenter')
  end

  def category(browser)
    browser.find_element(link_text: 'Uncategorized')
  end

  def log_in(browser)
    browser.find_element(link_text: 'Log in')
  end

  def entries_feed(browser)
    browser.find_element(link_text: 'Entries feed')
  end

  def comments_feed(browser)
    browser.find_element(link_text: 'Comments feed')
  end

  def wordpress(browser)
    browser.find_element(link_text: 'WordPress.org')
  end

  def archive_date(browser)
    browser.find_element(link_text: 'October 2018')
  end

  def comment_field(browser)
    browser.find_element(id: 'comment')
  end

  def author(browser)
    browser.find_element(id: 'author')
  end

  def email(browser)
    browser.find_element(id: 'email')
  end

  def website_url(browser)
    browser.find_element(id: 'url')
  end

  def submit_btn(browser)
    browser.find_element(id: 'submit')
  end

end
