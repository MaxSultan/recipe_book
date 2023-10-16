class PantryItemsController < ApplicationController
    before_action :authenticate_user!

    def create
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
        ingredient = current_user.ingredients.find_by(id: params[:id])
        @user_ingredient = current_user.user_ingredients.find_by(ingredient: ingredient)
        @user_ingredient.destroy 
        redirect_to ingredients_path, notice: "Removed #{ingredient.name} from your pantry"
    end

end
