# frozen_string_literal: true

require 'test_helper'

class PantryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user1)
    @ingredient = ingredients(:ingredient1)
  end

  test 'should redirect unauthenticated user' do
    sign_out :user
    get ingredients_url
    assert_response :redirect
  end

  test 'should add item to pantry' do
    assert_difference('UserIngredient.count') do
      post pantry_items_url, params: { ingredient_id: @ingredient.id }
    end
  end

  test 'should get destroy' do
    # rubocop:disable Lint/UselessAssignment
    current_user = users(:user1)
    # rubocop:enable Lint/UselessAssignment
    assert_difference('current_user.ingredients.count', -1) do
      delete pantry_item_url(@ingredient)
    end
    assert_redirected_to ingredients_url
  end
end
