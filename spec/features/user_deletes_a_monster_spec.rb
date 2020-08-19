require 'rails_helper'

feature "User deletes a monster" do
  let(:user) { create(:user) }
  let(:monster) { create(:monster, user: user) }

  scenario "they are notified the action was a success" do
    sign_in user
    visit monster_path(monster)

    click_link "Delete"

    expect(page).to have_content "Monster deleted"
  end
end