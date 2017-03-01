require "rails_helper"

RSpec.describe OwnerNoticeMailer, type: :mailer do
  describe "notify_message" do
    let(:mail) { OwnerNoticeMailer.notify_message }

    it "renders the headers" do
      expect(mail.subject).to eq("Notify message")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
