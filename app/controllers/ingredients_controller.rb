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

  def add_to_pantry
    @ingredients = Ingredient.all
    @my_ingredients = current_user.ingredients

    @added_ingredient = current_user.user_ingredients.create(ingredient_id: params[:ingredient_id])
    if @added_ingredient.save
      redirect_to ingredients_path, notice: "Added #{Ingredient.find(params[:ingredient_id]).name} to your pantry"
    else
      render :index, status: :unprocessable_entity
    end 
  end 

  def destroy
    @user_ingredient = current_user.user_ingredients.find_by(ingredient_id: params[:id])
    @user_ingredient.destroy 
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end 
end
