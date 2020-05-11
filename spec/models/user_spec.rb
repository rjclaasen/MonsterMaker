require 'rails_helper'

describe User, type: :model do
  context "with a 7 character long password" do
    subject { build(:user, password: "A" * 7) }
    it { is_expected.to_not be_valid }
  end

  context "with a 8 character long password" do
    subject { build(:user, password: "A" * 8) }
    it { is_expected.to be_valid }
  end
end
