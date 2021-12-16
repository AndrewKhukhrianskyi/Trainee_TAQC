# Documentation => https://www.mailslurp.com/docs/ruby/

require 'rspec'
require 'mailslurp_client'

require_relative 'common_variables'

# Config file for the API key
MailSlurpClient.configure do |config|
    config.api_key['x-api-key'] = "8bf2119ee0ece8075af34e0f01b24d2820d78f1fc67670d91a43df9fa200017a"
end

# Constants
inbox_controller = MailSlurpClient::InboxControllerApi.new
waitfor_controller = MailSlurpClient::WaitForControllerApi.new

# Testing
RSpec.describe('API testing') do
  context('API testing process') do
    it 'verifies that user can create email adresses' do
      inbox = inbox_controller.create_inbox
      !expect(inbox.id).is_a? NilClass
      expect(inbox.email_address).to include("mailslurp.com")
    end

    it 'verifies that user can create a specific email' do
      specific_inbox = inbox_controller.create_inbox_with_options({
        tags: TAGS_LIST,
        description: DESC,
        name: NAME
        })

      expect(specific_inbox.id && specific_inbox.description && specific_inbox.name).to be_truthy
    end

    it 'veirifes that user can update (configure) data in a specific email' do
      specific_inbox = inbox_controller.create_inbox_with_options({
        tags: TAGS_LIST,
        description: DESC,
        name: NAME
        })

      update_inbox = inbox_controller.update_inbox(specific_inbox.id, {
        'description': DESC_UPD})
      expect(update_inbox.description).to eq(DESC_UPD)
    end

# HTMl как то нужно передавать
    it 'verifies that user can send email and check data into them' do
      inbox = inbox_controller.create_inbox
      inbox_controller.send_email(inbox.id, {
        send_email_options: {
        to: (EMAIL),
        subject: SUBJECT,
        isHTML: true,
        body: HTML_BODY
        }
      })

      email_read = waitfor_controller.wait_for_latest_email({
        inbox_id: inbox.id,
        unread_only: true,
        timeout: 30_000
        })

      expect(email_read.subject).to include(SUBJECT)
      expect(email_read.body).to include(HTML_BODY)
    end
  end
end
