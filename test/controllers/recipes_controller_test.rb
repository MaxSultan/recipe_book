# frozen_string_literal: true

require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:user1)
  end

  test 'should redirect unauthenticated user' do
    sign_out :user
    get recipes_url
    assert_response :redirect
  end

  test 'should get index' do
    get recipes_url
    assert_response :success
  end

  test 'should get show' do
    get recipe_url(recipes(:one))
    assert_response :success
  end

  test 'should get new' do
    get recipes_new_url
    assert_response :success
  end

  test 'can create a new recipe' do
    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { name: 'test', instructions: 'test test', ingredients: [] } }
    end

    assert_redirected_to recipe_url(Recipe.last)
  end

  test 'cant create a new recipe with invalid attributes' do
    assert_no_difference('Recipe.count') do
      post recipes_url, params: { recipe: { name: '', instructions: '', ingredients: [] } }
    end
  end
end
