require 'rails_helper'

feature 'User edits username', type: :feature do
  scenario 'their username has changed' do
    user = create(:user)

    sign_in user

    visit edit_user_registration_path

    fill_in 'Username', with: "Name123"
    fill_in 'Current password', with: "password"

    click_button "Update"

    visit edit_user_registration_path

    expect(page).to have_field "Username", with: "Name123"
  end
end