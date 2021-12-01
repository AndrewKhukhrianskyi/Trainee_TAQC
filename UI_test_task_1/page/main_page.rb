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
    browser.find_element(xpath: '//ul/li/a[text()="Hello world!"]')
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

  def page_init(page)
    page_init = { 'banner' => page.banner, 'text banner' => page.banner_text, 'subtext banner' => page.banner_subtext,
                  'search field' => page.search_field, 'new posts' => page.posts_recent, 'comments '=> page.comments,
                  'archives tab' => page.archives, 'categories tab' => page.categories, 'meta bar' => page.meta,
                  'data entry' => page.entry_data, 'meta entry' => page.entry_meta, 'title entry' => page.entry_title, 'footer bar' => page.footer}
  end

  def com_page_init(page)
    comment_wdg = {'comment field' => page.comment_field, 'author bar' => page.author,
                   'comments page url' => page.website_url, 'submit button' => page.submit_btn}
  end
end
