require 'rails_helper'

describe Monster do
  context "with a 255 character long name" do
    subject { build(:monster) }
    it { is_expected.to be_valid }
  end
  context "with a 256 character long name" do
    subject { build(:monster, name: "A"*256) }
    it { is_expected.to_not be_valid }
  end
end