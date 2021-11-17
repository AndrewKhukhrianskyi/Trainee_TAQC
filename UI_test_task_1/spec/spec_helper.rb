# Adding all gems to the main file
require 'rspec'
require 'pry'
require 'selenium-webdriver'
require 'capybara'

require_relative '../env/common_variables'
require_relative '../pages/main_page'
require_relative '../drivers/driver'

def page_init(page)
  wdg = [page.banner, page.banner_text, page.banner_subtext,
        page.search_field, page.submit_search, page.posts_recent,
        page.comments, page.archives, page.categories, page.meta,
        page.entry_data, page.entry_meta, page.entry_title, page.footer]
end

def com_page_init(page)
  comment_wdg = [page.comment_field, page.author, page.website_url, page.submit_btn]
end

Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }
