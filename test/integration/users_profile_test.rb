require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.monsters.count.to_s, response.body
    assert_select 'div.pagination'
    @user.monsters.paginate(page: 1).each do |monster|
      assert_match CGI.escapeHTML(monster.name), response.body # CGI.escapeHTML for special characters with a different representation in HTML, such as " => &quot;
    end
  end
end
