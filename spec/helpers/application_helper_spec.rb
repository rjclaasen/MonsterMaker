require 'rails_helper'

describe ApplicationHelper do
  describe "#full_title" do
    context "when no parameter is passed" do
      subject { helper.full_title }
      it { is_expected.to eq "Monster Maker" }
    end

    context "when a parameter is passed" do
      subject { helper.full_title("Parameter") }
      it { is_expected.to eq "Parameter - Monster Maker" }
    end
  end
end