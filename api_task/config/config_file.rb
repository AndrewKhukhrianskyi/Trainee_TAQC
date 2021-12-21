require 'mailslurp_client'
require 'rspec'

# Config file for the API key
MailSlurpClient.configure do |config|
    config.api_key['x-api-key'] = "YOUR API KEY"
end
