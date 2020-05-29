require 'rails_helper'

describe Monster, type: :model do
  context "with a 255 character long name" do
    subject { build(:monster, name: "A" * 255) }
    it { is_expected.to be_valid }
  end

  context "with a 256 character long name" do
    subject { build(:monster, name: "A" * 256) }
    it { is_expected.to_not be_valid }
  end

  context "with a strength of 0" do
    subject { build(:monster, strength: 0) }
    it { is_expected.to be_valid }
  end

  context "with a strength of 0.1" do
    subject { build(:monster, strength: 0.1) }
    it { is_expected.to_not be_valid }
  end

  context "with no author" do
    subject { build(:monster, author: nil) }
    it { is_expected.to be_valid }
  end

  context "with an author" do
    subject { build(:monster, author: build(:user)) }
    it { is_expected.to be_valid }
  end
end