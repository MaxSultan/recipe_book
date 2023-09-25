class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    unless params.dig(:recipe, :ingredients).empty?
      ingreients = params[:recipe][:ingredients].reject(&:empty?)
      ingreients.each do |ingredient|
        @recipe.recipe_ingredients.create(ingredient_id: ingredient)
      end 
    end 

    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end 

  private 

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, ingredient_ids: [], ingredients_attributes: [:id, :name, :_destroy])
  end

end
