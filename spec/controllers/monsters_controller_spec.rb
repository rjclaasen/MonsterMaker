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
    let(:monster_params) { { name: "Edited Name" } }
    let(:params) { { id: test_monster.id, monster: monster_params } }

    before { test_monster }
    subject { patch :update, params: params }

    context "when the monster has an author" do
      let(:author) { create(:user) }
      let(:test_monster) { create(:monster, author: author, name: "Name") }

      context "and the update is done by the author" do
        before { sign_in author }

        context "when the name is updated" do
          let(:monster_params) { { name: "Edited Name" } }

          it { expect { subject }.to change{ test_monster.reload.name }.from("Name").to("Edited Name") }
        end

        context "when a Trait is updated" do
          before { test_monster.traits << build(:trait, name: "Unedited Trait") }

          let(:monster_trait) { test_monster.traits.first }
          let(:monster_params) { { name: test_monster.name, traits: [{ id: monster_trait.id, name: "Edited Trait"}] } }

          it { expect { subject }.to_not change(Trait, :count) }
          it { expect { subject }.to change{ test_monster.reload.traits.first.name }.from("Unedited Trait").to("Edited Trait") }
        end

        context "when an Action is updated" do
          before { test_monster.actions << build(:action, name: "Unedited Action") }

          let(:monster_action) { test_monster.actions.first }
          let(:monster_params) { { name: test_monster.name, actions: [{ id: monster_action.id, name: "Edited Action"}] } }

          it { expect { subject }.to_not change(Action, :count) }
          it { expect { subject }.to change{ test_monster.reload.actions.first.name }.from("Unedited Action").to("Edited Action") }
        end
      end

      context "and the update is not done by the author" do
        let(:not_author) { create(:user) }

        before { sign_in not_author }

        it { expect { subject }.to_not change{ test_monster.reload.name } }
      end
    end

    context "when the monster does not have an author" do
      let(:test_monster) { create(:monster, name: "Name") }

      it { expect { subject }.to_not change{ test_monster.reload.name } }
    end
  end

  describe "DELETE #destroy" do
    let!(:test_monster) { create(:monster) }

    subject { delete :destroy, params: { id: test_monster.id } }

    context "when the monster has an author" do
      let(:test_monster) { create(:monster, author: author) }
      let(:author) { create(:user) }

      context "and the delete is done by the author" do
        before { sign_in author }

        it { expect { subject }.to change{ Monster.count }.by(-1) }
      end

      context "and the delete is not done by the author" do
        let(:not_author) { create(:user) }

        before { sign_in not_author }

        it { expect { subject }.to_not change{ Monster.count } }
      end
    end

    context "when the monster does not have an author" do
      it { expect { subject }.to_not change{ Monster.count } }
    end
  end
end
