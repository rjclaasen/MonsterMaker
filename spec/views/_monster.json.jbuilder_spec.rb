require 'rails_helper'

describe "monsters/show.json" do
  context "when the monster has an owner" do
    let(:email) { Faker::Internet.email }
    let(:time) { 1.year.ago }
    let(:user) { build(:user, username: "User123", email: email, created_at: time, updated_at: time) }

    it "does not display their email" do
      assign(:monster, create(:monster, user: user))
      
      render

      expect(rendered).to_not have_content email
    end

    it "does not display when the account was created or updated" do
      assign(:monster, create(:monster, user: user))
      
      render

      expect(rendered).to_not have_content time.to_json
    end

    it "displays their username" do
      assign(:monster, create(:monster, user: user))

      render

      expect(rendered).to have_content "User123"
    end
  end
end