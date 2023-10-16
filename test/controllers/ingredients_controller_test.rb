# frozen_string_literal: true

require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user1)
  end

  test 'should redirect unauthenticated user' do
    sign_out :user
    get ingredients_url
    assert_response :redirect
  end

  test 'should get index' do
    get ingredients_url
    assert_response :success
  end

  test 'should get new' do
    get new_ingredient_url
    assert_response :success
  end

  test 'can create a new ingredient' do
    assert_difference('Ingredient.count') do
      post ingredients_url, params: { ingredient: { name: 'random' } }
    end
  end

  test 'cant create a new ingredient with invalid attributes' do
    assert_no_difference('Ingredient.count') do
      post ingredients_url, params: { ingredient: { name: '' } }
    end
  end
end
