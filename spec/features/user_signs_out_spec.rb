require 'rails_helper'

feature 'User signs out', type: :feature do
  scenario 'they see the logout alert and navigation bar change' do
    user = create(:user)

    sign_in user

    visit root_path

    click_link "Sign out"

    expect(page).to have_content "Signed out successfully."
    expect(page).to have_content "Sign in"
  end
end
