require 'test_helper'

class MonstersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster = monsters(:vortigaunt)
  end

  test "should get index" do
    get monsters_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_url
    assert_response :success
  end

  test "should create monster" do
    assert_difference('Monster.count') do
      post monsters_url, params: { monster: { damage: @monster.damage, hitPoints: @monster.hitPoints, name: @monster.name, user_id: @monster.user_id } }
    end

    follow_redirect!
    assert_template 'monsters/show'
  end

  test "should show monster" do
    get monster_url(@monster)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_url(@monster)
    assert_response :success
  end

  test "should update monster" do
    patch monster_url(@monster), params: { monster: { damage: @monster.damage, hitPoints: @monster.hitPoints, name: @monster.name, user_id: @monster.user_id } }
    assert_redirected_to monster_url(@monster)
  end

  test "should destroy monster" do
    assert_difference('Monster.count', -1) do
      delete monster_url(@monster)
    end

    assert_redirected_to monsters_url
  end
end
