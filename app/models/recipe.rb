class Recipe < ApplicationRecord
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients

    accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

    validates :name, presence: true
    validates :instructions, presence: true
end
