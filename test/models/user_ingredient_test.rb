require "test_helper"

class UserIngredientTest < ActiveSupport::TestCase

  test "must have ingredient" do
    user_ingredient = UserIngredient.new(user: users(:user1))
    user_ingredient.valid?
    assert_not user_ingredient.errors[:ingredient].empty?
  end

  test "must have user" do
    user_ingredient = UserIngredient.new(ingredient: ingredients(:ingredient1))
    user_ingredient.valid?
    assert_not user_ingredient.errors[:user].empty?
  end

end
