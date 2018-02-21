require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "GM-Tools"
    assert_equal full_title("Help"), "Help - GM-Tools"
  end
end
