require "rails_helper"

RSpec.describe CommentMailer, type: :mailer do
  describe "comment_created" do
    let(:mail) { CommentMailer.comment_created }

    it "renders the headers" do
      mail.subject).to eq("Comment created")
      mail.to).to eq(["to@example.org"])
      mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded).to match("Hi")
    end
  end

end
