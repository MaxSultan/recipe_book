# frozen_string_literal: true

class AddNameToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :name, :string
  end
end
