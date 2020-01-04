require 'rails_helper'

describe MonstersController do
  describe "POST #create" do
    subject { -> { post :create, params: { monster: monster_params } } }

    context "when the monster is invalid" do
      let(:monster_params) { attributes_for(:monster, name: "A"*256 ) }

      it { is_expected.to_not change(Monster, :count) } 
    end

    context "when the monster is valid" do
      let(:monster_params) { attributes_for(:monster) }

      it { is_expected.to change(Monster, :count).by(1) }

      it "redirects to the monster's page" do
        post :create, params: { monster: monster_params }

        expect(response).to redirect_to(assigns(:monster))
      end
    end
  end
end