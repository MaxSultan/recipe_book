# frozen_string_literal: true

require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase
  test 'must have ingredient' do
    recipe_ingredient = RecipeIngredient.new(recipe: recipes(:one))
    recipe_ingredient.valid?
    assert_not recipe_ingredient.errors[:ingredient].empty?
  end

  test 'must have recipe' do
    recipe_ingredient = RecipeIngredient.new(ingredient: ingredients(:ingredient1))
    recipe_ingredient.valid?
    assert_not recipe_ingredient.errors[:recipe].empty?
  end
end
