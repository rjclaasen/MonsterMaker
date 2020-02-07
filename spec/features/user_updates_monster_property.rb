require 'rails_helper'

feature 'User updates a monster with a property', js: true do
  scenario 'they see the updated property on the page' do
    monster = create(:monster, properties: build(:property, name: "Unedited Property"))

    visit monster_path(monster)

    page.find('h3', text: "Properties").find(:xpath, "..")
      .fill_in 'Name', with: "Edited Property"

    click_button "Update Monster"

    expect(page).to_not have_content "Unedited Property"
    expect(page).to have_content "Edited Property"
  end
end
