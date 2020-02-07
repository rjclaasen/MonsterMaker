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

  describe "PATCH #update" do
    let(:test_monster) { create(:monster, name: "Name") }
    let(:params) { { id: test_monster.id, monster: monster_params } }

    before { test_monster }
    subject { patch :update, params: params }

    context "when the name is updated" do
      let(:monster_params) { { name: "Edited Name" } }

      it { expect { subject }.to change{ Monster.first.name }.from("Name").to("Edited Name") }
    end

    context "when a property is updated" do
      before { test_monster.properties << build(:property, name: "Unedited Property") }

      let(:monster_property) { test_monster.properties.first }
      let(:monster_params) { { name: test_monster.name, properties: [{ id: monster_property.id, name: "Edited Property"}] } }

      it { expect { subject }.to_not change(Property, :count) }
      it { expect { subject }.to change{ test_monster.reload.properties.first.name }.from("Unedited Property").to("Edited Property") }
    end
  end
end