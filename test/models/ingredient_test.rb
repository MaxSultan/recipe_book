require "test_helper"

class IngredientTest < ActiveSupport::TestCase

  test "valid if name exists" do
    ingredient = Ingredient.new(name: 'asd')
    ingredient.valid?
    assert ingredient.errors[:name].empty?  
  end 

  test "invalid if name does not exists" do
    ingredient = Ingredient.new()
    ingredient.valid?
    assert_not ingredient.errors[:name].empty?
  end

  test "invalidates attempt to create second model with same name" do
    ingredient = Ingredient.new(name: 'asd')
    ingredient.valid?
    assert ingredient.errors[:name].empty?
    ingredient.save

    duplicate = Ingredient.new(name: 'asd')
    duplicate.valid?
    assert_not duplicate.errors[:name].empty?
  end 

end
