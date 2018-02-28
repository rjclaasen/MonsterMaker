require 'test_helper'

class MonstersInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "monster interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Monster.count' do
      post monsters_path, params: { monster: { name: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    name = "Tidus the Doombringer"
    assert_difference 'Monster.count', 1 do
      post monsters_path, params: { monster: { name: name } }
    end
    follow_redirect!
    assert_template 'monsters/show'
    # Edit monster
    assert_select 'a', text: "Edit"
    aarakocra = @user.monsters.paginate(page: 1).first
    get edit_monster_path(aarakocra)
    assert_template 'monsters/edit'
    # Delete monster
    assert_select 'a', text: "Delete"
    assert_difference 'Monster.count', -1 do
      delete monster_path(aarakocra)
    end
    # Visit different user's monster (no delete links)
    get monster_path(users(:archer).monsters.first)
    assert_select 'a', text: "delete", count: 0
  end
end
