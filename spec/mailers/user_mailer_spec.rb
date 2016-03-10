require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "thank_you" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.thank_you(user) }


    it "renders the headers" do
      expect(mail.subject).to eq("Thanks for signing up")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
