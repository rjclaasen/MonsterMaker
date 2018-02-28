require 'test_helper'

class MonstersControllerTest < ActionDispatch::IntegrationTest
  setup do
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
    get edit_monster_path(@monster)
    assert_response :success
  end

  test "should update monster" do
    patch monster_path(@monster), params: { monster: { damage: @monster.damage, hitPoints: @monster.hitPoints, name: @monster.name, user_id: @monster.user_id } }
    assert_redirected_to monster_path(@monster)
  end

  test "should destroy monster" do
    assert_difference('Monster.count', -1) do
      delete monster_path(@monster)
    end

    assert_redirected_to monsters_path
  end
end
