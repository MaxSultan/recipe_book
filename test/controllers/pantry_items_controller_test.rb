require "test_helper"

class PantryItemsControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:user1)
  end

  test "should get destroy" do
    current_user = users(:user1)
    assert_difference('current_user.ingredients.count', -1) do
      delete pantry_item_path(ingredients(:ingredient1))
    end
    assert_redirected_to ingredients_url
  end
end
