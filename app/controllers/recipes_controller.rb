class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if ingredients_params[:ingredients]
      ingredients_params[:ingredients].each do |id, selected|
        @recipe.ingredients << Ingredient.find(id) if selected == '1'
      end
    end

    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    puts @recipe.ingredients[1].nil? ? false : true
    puts @recipe.ingredients[1].nil? ? false : true
    puts @recipe.ingredients[1].nil? ? false : true
    puts @recipe.ingredients[1].nil? ? false : true
    puts @recipe.ingredients[1].nil? ? false : true
    puts @recipe.ingredients[1].nil? ? false : true
    puts @recipe.ingredients[1].nil? ? false : true
    puts @recipe.ingredients[1].nil? ? false : true
    puts @recipe.ingredients[1].nil? ? false : true

    if ingredients_params[:ingredients]
      ingredients = []
      ingredients_params[:ingredients].each do |id, selected|
        ingredients << Ingredient.find(id) if selected == '1'
      end
    end

    @recipe.ingredients = ingredients

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name)
    end

    def ingredients_params
      params.require(:recipe).permit(:ingredients => {})
    end
end
