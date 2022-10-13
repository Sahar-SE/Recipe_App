class RecipesController < ApplicationController
  def show
    @recipe = Recipe.all
  end
end
