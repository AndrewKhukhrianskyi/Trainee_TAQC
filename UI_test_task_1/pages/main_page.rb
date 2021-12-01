class MainPage
  def url_include?(data)
    browser.current_url.include?(data)
  end

  def banner
    browser.find_element(class: 'site-header')
  end

  def banner_text
    browser.find_element(class: 'site-title')
  end

  def banner_subtext
    browser.find_element(class: 'site-description')
  end

  def search_field
    browser.find_element(class: 'search-field')
  end

  def scroll_down
    browser.find_element(class: 'menu-scroll-down')
  end

  def enter_data(data)
    search_field.send_keys(data)
  end

  def submit_search
    browser.find_element(class: 'search-submit')
  end

  def posts_recent
    browser.find_element(id: 'recent-posts-2')
  end

  def comments
    browser.find_element(id: 'recent-comments-2')
  end

  def archives
    browser.find_element(id: 'archives-2')
  end

  def categories
    browser.find_element(id: 'categories-2')
  end

  def meta
    browser.find_element(id: 'meta-2')
  end

  def posts
    browser.find_element(class: 'page-title')
  end

  def entry_meta
    browser.find_element(class: 'entry-meta')
  end

  def entry_title
    browser.find_element(class: 'entry-title')
  end

  def posts_button
    browser.find_element(class: 'more_link')
  end

  def entry_data
    browser.find_element(class: 'entry-content')
  end

  def footer
    browser.find_element(class: 'site-info')
  end

  def post_example
    browser.find_element(link_text: 'Hello world!')
  end

  def comment
    browser.find_element(link_text: 'A WordPress Commenter')
  end

  def category
    browser.find_element(link_text: 'Uncategorized')
  end

  def log_in
    browser.find_element(link_text: 'Log in')
  end

  def entries_feed
    browser.find_element(link_text: 'Entries feed')
  end

  def comments_feed
    browser.find_element(link_text: 'Comments feed')
  end

  def wordpress
    browser.find_element(link_text: 'WordPress.org')
  end

  def archive_date
    browser.find_element(link_text: 'October 2018')
  end

  def comment_field
    browser.find_element(id: 'comment')
  end

  def author
    browser.find_element(id: 'author')
  end

  def email
    browser.find_element(id: 'email')
  end

  def website_url
    browser.find_element(id: 'url')
  end

  def submit_btn
    browser.find_element(id: 'submit')
  end

  def widgets
    wdg = [banner, banner_text, banner_subtext,
          search_field, submit_search, posts_recent,
          comments, archives, categories, meta,
          entry_data, entry_meta, entry_title, footer]
  end

  def comments_wdg
    comment_wdg = [comment_field, author, website_url, submit_btn]
  end

end
