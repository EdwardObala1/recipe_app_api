class RecipesController < ApplicationController

  # recipe list
  def list
  end

  # show each item on its own page
  def show
    redirect_to recipe_item_path + "/" + params[:id] 
  end

  def add
    @new_recipe = Recipe.create(recipe_params)
    if @new_recipe
      puts @new_recipe.title
    end
  end

  def edit
    if request.post?
      recipe = Recipe.find_by(id: recipe_params[:id])
      recipe_params.keys.each do |parameter|
        if parameter != 'id'
          recipe.update(parameter => recipe_params[parameter.to_sym])
        end
      end
    end
  end

  def delete 
    recipe = Recipe.find_by(id: recipe_params[:id])
    recipe.destroy
  end

  def recommend
    if session[:user_id] == recipe_params[:user_id]
      recipe = Recipe.find_by(id: recipe_params[:id])
      recipe.recommendations += 1
      recipe.save
    end
  end
  

  def recipe_params
    params.require(:recipe).permit(:id, :title, :body, :ingredients, :user_id)
  end

end
