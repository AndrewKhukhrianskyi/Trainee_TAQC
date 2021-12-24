require 'mailslurp_client'
require 'rspec'

# Config file for the API key
class ApiClass
  def initialize
    return 'API_KEY is required' if ENV['API_KEY'].nil?
    MailSlurpClient.configure do |config|
      config.api_key['x-api-key'] = ENV['API_KEY'].to_sym
    end
  end
end

ApiClass.new
