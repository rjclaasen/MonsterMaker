require 'rails_helper'

feature 'User creates a monster' do
  scenario 'they see the name on the page' do
    visit new_monster_path

    fill_in 'Name', with: "My Monster"
    click_button "Create Monster"

    expect(page).to have_content "My Monster"
  end

  context 'with an ability score' do
    scenario 'they see the ability score on the page' do
      visit new_monster_path

      fill_in 'Name', with: "My Monster"
      fill_in 'Strength', with: 8

      click_button "Create Monster"

      expect(page).to have_content "8"
    end
  end

  context 'with a trait', js: true do
    scenario 'they see the trait on the page' do
      visit new_monster_path

      fill_in 'Name', with: "My Monster"
      click_link "Add trait"
      page.find('h3', text: "Traits").find(:xpath, '..')
        .fill_in 'Name', with: "My Trait"

      click_button "Create Monster"

      expect(page).to have_content "My Trait"
    end
  end

  context 'with an action', js: true do
    scenario 'they see the action on the page' do
      visit new_monster_path

      fill_in 'Name', with: "My Monster"
      click_link "Add action"
      page.find('h3', text: "Actions").find(:xpath, '..')
        .fill_in 'Name', with: "My Action"

      click_button "Create Monster"

      expect(page).to have_content "My Action"
    end
  end

  context 'with a reaction', js: true do
    scenario 'they see the reaction on the page' do
      visit new_monster_path

      fill_in 'Name', with: "My Monster"
      click_link "Add reaction"
      page.find('h3', text: "Reactions").find(:xpath, '..')
        .fill_in 'Name', with: "My Reaction"

      click_button "Create Monster"

      expect(page).to have_content "My Reaction"
    end
  end
end
