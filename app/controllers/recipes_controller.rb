class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(recipe_id: 0)
    @recipe.ingredients.build(recipe_id: 1)
  end

  def create
    @recipe = Recipe.create(recipes_param)

    redirect_to recipe_path(@recipe)
  end

  private
  def recipes_param
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end
end
