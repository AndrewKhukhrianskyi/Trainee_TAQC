# Documentation => https://www.mailslurp.com/docs/ruby/

require_relative 'config/common_variables'
require_relative 'config/config_file'

# Constants
inbox_controller = MailSlurpClient::InboxControllerApi.new
waitfor_controller = MailSlurpClient::WaitForControllerApi.new

# Testing
RSpec.describe('API testing') do
  context('API testing process') do
    it 'verifies that user can create email addresses' do
      inbox = inbox_controller.create_inbox
      expect(inbox.id).not_to NilClass
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

    it 'verifies that user can send email' do
      inbox = inbox_controller.create_inbox
      inbox_2 = inbox_controller.create_inbox
      opts = {
      send_email_options: MailSlurpClient::SendEmailOptions.new(
      {
        to: [inbox_2.email_address],
        subject: SUBJECT,
        from: inbox.email_address,
        is_html: true,
        body: HTML_BODY
        })
      }


      inbox_controller.send_email(inbox.id, opts)
      expect(inbox_2.id).to be_truthy

      email_read = waitfor_controller.wait_for_latest_email({
        inbox_id: inbox_2.id,
        unread_only: true,
        timeout: 30_000
        })

      expect(email_read.body).to include(HTML_BODY)
    end
  end
end
