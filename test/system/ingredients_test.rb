# frozen_string_literal: true

require 'application_system_test_case'

class IngredientsTest < ApplicationSystemTestCase
  test 'can create ingredients' do
    sign_in users(:user1)
    visit ingredients_url
    assert_selector 'h1', text: 'Ingredients'

    click_on 'Add an ingredient'
    fill_in 'Name', with: 'New Ingredient'
    click_on 'Add Ingredient'

    assert_selector 'h1', text: 'Ingredients'
    assert_selector 'li', text: 'New Ingredient'
  end
end
