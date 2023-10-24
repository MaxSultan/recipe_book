# frozen_string_literal: true

require 'application_system_test_case'

class RecipesTest < ApplicationSystemTestCase
  test 'can create and view a recipe' do
    sign_in users(:user1)
    visit recipes_url
    click_on 'Add a Recipe'

    assert_selector 'h1', text: 'Create New Recipe'
    fill_in 'Name', with: 'Recipe 626'
    fill_in 'Instructions', with: '1) Ohana means family'
    fill_in 'New Ingredient Name', with: 'Stitch'
    click_on 'Add Ingredient'

    select 'ingredient1', from: 'Ingredients'
    click_on 'Create Recipe'

    assert_selector 'h1', text: 'Recipe 626'
  end
end
