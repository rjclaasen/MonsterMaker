# Find more about how to test this at http://guides.rubyonrails.org/testing.html#testing-your-mailers

require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  def setup
    @user = users(:michael)
  end

  test "account_activation" do
    # Create the email
    @user.activation_token = User.new_token
    email = UserMailer.account_activation(@user)

    # Send email and test queue
    assert_emails 1 do
      email.deliver_now
    end

    # Test headers of sent email
    assert_equal ["noreply@monstermaker.org"], email.from
    assert_equal [@user.email], email.to
    assert_equal "Account activation", email.subject

    # Test text body of sent email
    assert_match @user.name,               email.text_part.body.to_s
    assert_match @user.activation_token,   email.text_part.body.to_s
    assert_match CGI.escape(@user.email),  email.text_part.body.to_s

    # Test html body of sent email
    assert_match @user.name,               email.html_part.body.to_s
    assert_match @user.activation_token,   email.html_part.body.to_s
    assert_match CGI.escape(@user.email),  email.html_part.body.to_s
  end

  test "password_reset" do
    # Create the email
    @user.reset_token = User.new_token
    email = UserMailer.password_reset(@user)

    # Send email and test queue
    assert_emails 1 do
      email.deliver_now
    end

    # Test headers of sent email
    assert_equal ["noreply@monstermaker.org"], email.from
    assert_equal [@user.email], email.to
    assert_equal "Password reset", email.subject

    # Test text body of sent email
    assert_match @user.reset_token,        email.text_part.body.to_s
    assert_match CGI.escape(@user.email),  email.text_part.body.to_s

    # Test html body of sent email
    assert_match @user.reset_token,        email.html_part.body.to_s
    assert_match CGI.escape(@user.email),  email.html_part.body.to_s
  end
end
