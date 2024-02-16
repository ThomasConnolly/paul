require "rails_helper"

RSpec.describe MinutesMailer, type: :mailer do
  describe "new_vestry_minutes_email" do
    let(:mail) { MinutesMailer.new_vestry_minutes_email }

    it "renders the headers" do
      expect(mail.subject).to eq("New vestry minutes email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
