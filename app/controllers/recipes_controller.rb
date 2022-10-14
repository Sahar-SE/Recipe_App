class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes([:user]).all.order(created_at: :desc)
  end

  def public
    @public_recipes = Recipe.includes([:user]).where(public: true).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.includes([:user]).find(params[:id])
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to user_recipes_path
    else
      render 'show'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
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
