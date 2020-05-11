require 'rails_helper'

describe Trait, type: :model do
  context "with a 255 character long name" do
    subject { build(:trait) }
    it { is_expected.to be_valid }
  end

  context "with a 256 character long name" do
    subject { build(:trait, name: "A" * 256) }
    it { is_expected.to_not be_valid }
  end
end
