class IngredientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @ingredients = Ingredient.all
    @my_ingredients = current_user.ingredients
    @makeable_recipes = Recipe.with_all_ingredients(current_user.id).uniq
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = current_user.ingredients.create(ingredient_params)

    if @ingredient.save
      redirect_to  ingredients_path
    else
      render :new, status: :unprocessable_entity
    end 
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end 
end
