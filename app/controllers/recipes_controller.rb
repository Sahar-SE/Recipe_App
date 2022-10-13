class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def public
    @public_recipes = Recipe.where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    respond_to do |format|
      format.html do
        redirect_to user_recipes_path(user_id: @recipe.user.id), notice: 'Recipe was successfully deleted.'
      end
    end
  end
end
