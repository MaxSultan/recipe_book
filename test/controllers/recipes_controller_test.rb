require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:user1)
  end

  test "should get new" do
    get recipes_new_url
    assert_response :success
  end

  test "can create a new recipe" do
    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { name: 'test', instructions: 'test test', ingredients: [] } }
    end
  end 

  test "cant create a new recipe with invalid attributes" do
    assert_no_difference('Recipe.count') do
      post recipes_url, params: { recipe: { name: '', instructions: '', ingredients: [] } }
    end
  end 

end
