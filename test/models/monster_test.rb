require 'test_helper'

class MonsterTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @monster = @user.monsters.build(name: "Vortigaunt", hitPoints: 10, damage: 1)
  end

  test "should be valid" do
    assert @monster.valid?
  end

  test "user id should be present" do
    @monster.user_id = nil
    assert_not @monster.valid?
  end

  test "name should be present" do
    @monster.name = "   "
    assert_not @monster.valid?
  end

  test "name should be at most 255 characters" do
    @monster.name = "a" * 256
    assert_not @monster.valid?
  end

  test "order should be alphabetical" do
    assert_equal monsters(:aarakocra), Monster.first
  end

  test "associated monsters should be destroyed" do
    @user = users(:malory) # Other users already have monsters assigned to them. Malory does not.
    @user.save
    @user.monsters.create!(name: "Hydralisk")
    assert_difference 'Monster.count', -1 do
      @user.destroy
    end
  end
end
