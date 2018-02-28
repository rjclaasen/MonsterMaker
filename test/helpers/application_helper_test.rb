require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Monster Maker"
    assert_equal full_title("Help"), "Help - Monster Maker"
  end
end
