require 'rails_helper'

feature 'User creates a monster' do
  scenario 'they see the monster on the page' do
    visit new_monster_path

    fill_in 'Name', with: "My Monster"
    click_button "Create Monster"

    expect(page).to have_css ".monster-name", text: "My Monster"
  end
end