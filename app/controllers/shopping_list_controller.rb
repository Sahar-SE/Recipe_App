class ShoppingListController < ApplicationController
    def index
      @recipe = Recipe.find(params[:recipe_id])
      @recipe_food = RecipeFood.all.includes([:food]).sort_by { |recipe_food| recipe_food.food.name }
      @food = Food.all
      @total_price = current_user.sum(@recipe.recipe_food.includes([:food]))
    end
  
    def show
      @recipe = Recipe.find(params[:recipe_id])
      @recipe_food = RecipeFood.all
      @food = Food.all
      @total_price = 0
      @recipe_food.each do |fd|
        @total_price += fd.quantity * fd.food.price
      end
    end
end