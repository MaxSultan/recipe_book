# frozen_string_literal: true

require 'application_system_test_case'

class PantryItemsTest < ApplicationSystemTestCase
  test 'can add and remove ingredients from pantry' do
    sign_in users(:user2)
    visit ingredients_url
    assert_selector 'h1', text: 'Ingredients'

    Capybara.match = :first
    click_on 'Add ingredient to pantry'
    assert_selector 'p', text: 'Added ingredient1 to your pantry'

    click_on 'Remove from pantry'
    assert_selector 'p', text: 'Removed ingredient1 from your pantry'
  end
end
