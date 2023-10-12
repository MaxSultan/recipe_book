class Recipe < ApplicationRecord
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients

    accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

    validates :name, presence: true
    validates :instructions, presence: true

    scope :with_all_ingredients, ->(user_id) {
        joins(:ingredients)
          .where("NOT EXISTS (
                    SELECT ri.id
                    FROM recipe_ingredients AS ri
                    WHERE ri.recipe_id = recipes.id
                      AND ri.ingredient_id NOT IN (
                        SELECT ui.ingredient_id
                        FROM user_ingredients AS ui
                        WHERE ui.user_id = ?
                      )
                  )", user_id)
      }
end