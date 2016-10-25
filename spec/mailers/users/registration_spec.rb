require "rails_helper"

RSpec.describe Users::RegistrationMailer, type: :mailer do
  describe "send_credentials" do
    let(:mail) { Users::RegistrationMailer.send_credentials }

    it "renders the headers" do
      expect(mail.subject).to eq("Send credentials")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
