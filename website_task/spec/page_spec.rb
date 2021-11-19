require_relative 'spec_helper'

web_pg = WebPage.new

RSpec.describe('Webpage testing') do
  before(:all) do
    browser.get(MAIN_PAGE)
  end

  after(:all) do
    browser.close()
  end
  context 'Functional testing' do
    it 'verifies that user can register a new account' do
        web_pg.reg_process(TEXT)

        expect(web_pg.success_message.text) == 'Спасибо за регистрацию!'
    end
  end
end
