require 'mailslurp_client'
require 'rspec'

# Config file for the API key
class ApiClass
  def initialize
    return 'NO API!' if ENV['API-KEY'].nil?
    MailSlurpClient.configure do |config|
      config.api_key['x-api-key'] = ENV['API-KEY'].to_sym
    end
  end
end

ApiClass.new
