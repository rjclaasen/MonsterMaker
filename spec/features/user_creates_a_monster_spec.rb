require 'rails_helper'

feature 'User creates a monster' do
  scenario 'they see the monster on the page' do
    visit new_monster_path

    fill_in 'Name', with: "My Monster"
    click_button "Create Monster"

    expect(page).to have_content "My Monster"
  end
end

feature 'User creates a monster with a trait', js: true do
  scenario 'they see the monster on the page' do
    visit new_monster_path

    fill_in 'Name', with: "My Monster"
    click_link "Add trait"
    page.find('h3', text: "Traits").find(:xpath, '..')
      .fill_in 'Name', with: "My Trait"

    click_button "Create Monster"

    expect(page).to have_content "My Monster"
    expect(page).to have_content "My Trait"
  end
end