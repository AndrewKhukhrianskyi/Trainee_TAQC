# Adding all gems to the main file
require 'rspec'
require 'pry'
require 'selenium-webdriver'
require 'capybara'

require_relative '../env/common_variables'
require_relative '../pages/main_page'
require_relative '../drivers/driver'

# Bugs
=begin
class StartUI
  attr_accessor :ui, :ui_comment

  def initialize
    @ui = [main_pg.banner, main_pg.banner_text, main_pg.banner_subtext,
        main_pg.search_field, main_pg.submit_search, main_pg.posts,
        main_pg.comments, main_pg.archives, main_pg.categories,
        main_pg.meta, main_pg.entry_meta, main_pg.entry_title,
        main_pg.entry_data, main_pg.footer]

    @ui_comment = [main_pg.comment_field, main_pg.website_url,
                main_pg.submit_btn]
  end
=end


Dir[File.join(Dir.pwd, 'pages/**/*.rb')].each { |f| require f }
