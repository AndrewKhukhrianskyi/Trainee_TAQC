# Adding all gems to the main file
require 'rspec'
require 'pry'
require 'selenium-webdriver'
require 'capybara'

require_relative '../env/common_variables'
require_relative '../pages/main_page'
require_relative '../drivers/driver'

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

Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }
