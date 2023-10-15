require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:user1)
    @ingredient = ingredients(:ingredient1)
  end

  test "should redirect unauthenticated user" do
    sign_out :user
    get ingredients_url
    assert_response :redirect
  end 

  test "should get index" do
    get ingredients_url
    assert_response :success
  end

  test "should get new" do
    get new_ingredient_url, params: {id: 1}
    assert_response :success
  end

  test "should get destroy" do
    current_user = users(:user1)
    assert_difference('current_user.ingredients.count', -1) do
      delete ingredient_url(@ingredient)
    end
    assert_redirected_to ingredients_url
  end

end
