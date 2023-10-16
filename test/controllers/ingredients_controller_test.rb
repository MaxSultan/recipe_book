require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:user1)
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

end
