require 'rails_helper'

feature 'User signs in' do
  scenario 'they see the login alert and navigation bar change' do
    create(:user, email: "email@website.com", password: "password")

    visit new_user_session_path

    fill_in 'Email', with: "email@website.com"
    fill_in 'Password', with: "password"

    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Sign out"
  end
end
