require 'nokogiri'
require 'open-uri'
require 'json'
require 'selenium-webdriver'

require_relative 'driver'
require_relative 'parser_2_class'

# Way to get access to the page
browser.get('https://www.google.com/')

parser_pg = FindPage.new
parser_pg.find_input.send_keys('Ruby')
parser_pg.search_btn.click

html_page = Nokogiri::HTML(URI.open(browser.current_url))
search_results = html_page.xpath('//h1')

all_links = search_results.map {|text| text['text'] if text['text']}.compact

browser.close()
