# frozen_string_literal: true

class CreateUserIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :user_ingredients do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
