require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  test "layout links" do
    get root_path
    # Things it should have
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path,    count: 2
    assert_select "a[href=?]", help_path,    count: 1
    assert_select "a[href=?]", about_path,   count: 1
    assert_select "a[href=?]", contact_path, count: 1
    # Things it shouldn't have
    assert_select "a[href=?]", logout_path,  count: 0
  end

  test "layout normal user" do
    log_in_as(@non_admin)
    get root_path
    # Things it should have
    assert_select "a[href=?]", user_path(@non_admin)       # Can have multiple instances because feed (or other things?)
    assert_select "a[href=?]", edit_user_path(@non_admin), count: 1
    assert_select "a[href=?]", logout_path,                count: 1
    # Things it shouldn't have
    assert_select "a[href=?]", users_path,                 count: 0
  end

  test "layout admin" do
    log_in_as(@admin)
    get root_path
    assert_select "a[href=?]", users_path, count: 1
  end
end
