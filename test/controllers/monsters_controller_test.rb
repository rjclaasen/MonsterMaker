require 'test_helper'

class MonstersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:michael)
    @monster = monsters(:vortigaunt)
  end

  test "should get index" do
    get monsters_path
    assert_response :success
  end

  test "should get new" do
    get new_monster_path
    assert_response :success
  end

  test "should create monster" do
    log_in_as(@user)
    assert_difference('Monster.count') do
      post monsters_path, params: { monster: { damage: @monster.damage, hitPoints: @monster.hitPoints, name: @monster.name, user_id: @monster.user_id } }
    end

    follow_redirect!
    assert_template 'monsters/show'
  end

  test "should show monster" do
    get monster_path(@monster)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_monster_path(@monster)
    assert_response :success
  end

  test "should update monster" do
    log_in_as(@user)
    monsterNewDamage = @monster.damage + 1
    patch monster_path(@monster), params: { monster: { damage: monsterNewDamage } }
    assert_equal(monsterNewDamage, @monster.reload.damage)
    assert_redirected_to monster_path(@monster)
  end

  test "should destroy monster" do
    log_in_as(@user)
    assert_difference('Monster.count', -1) do
      delete monster_path(@monster)
    end

    assert_redirected_to monsters_path
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Monster.count' do
      post monsters_path, params: { monster: { name: "Zergling", user_id: @user.id } }
    end
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    # TODO: test this.
  end

  test "should redirect update when not logged in" do
    monsterName = @monster.name
    patch monster_path(@monster), params: { monster: { name: "Baneling" } }
    assert_redirected_to login_url
    assert_equal(monsterName, @monster.reload.name)
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Monster.count' do
      delete monster_path(@monster)
    end
    assert_redirected_to login_url
  end

  test "should redirect edit for non-owner of monster" do
    # TODO: test this.
  end

  test "should redirect update for non-owner of monster" do
    # TODO: test this.
  end

  test "should redirect destroy for non-owner of monster" do
    log_in_as(users(:archer))
    monster = monsters(:vortigaunt)
    assert_no_difference 'Monster.count' do
      delete monster_path(monster)
    end
    assert_redirected_to root_url
  end
end
