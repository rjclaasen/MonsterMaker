require 'rails_helper'

feature 'User signs up', type: :feature do
  scenario 'they submit their account information and are shown an alert' do
    visit new_user_registration_path

    fill_in 'Email', with: "email@website.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"

    click_button "Sign up"

    expect(page).to have_content "Please follow the link to activate your account."
  end

  scenario 'they use the activation link, see an alert, and are redirected to login page' do
    user = create(:user, confirmed: false)

    visit user_confirmation_path(confirmation_token: user.confirmation_token)

    expect(page).to have_content "Your email address has been successfully confirmed."
    expect(page).to have_current_path new_user_session_path
  end
end
