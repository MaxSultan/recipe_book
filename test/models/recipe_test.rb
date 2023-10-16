# frozen_string_literal: true

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test 'must have instructions' do
    recipe = Recipe.new(name: 'test')
    recipe.valid?
    assert_not recipe.errors[:instructions].empty?
  end

  test 'must have name' do
    recipe = Recipe.new(instructions: 'test')
    recipe.valid?
    assert_not recipe.errors[:name].empty?
  end

  test 'with_all_ingredients scope includes correct recipes' do
    assert Recipe.with_all_ingredients(users(:user1).id).include?(recipes(:one))
  end

  test 'with_all_ingredients scope does not include incorrect recipes' do
    assert_not Recipe.with_all_ingredients(users(:user1).id).include?(recipes(:two))
  end
end
