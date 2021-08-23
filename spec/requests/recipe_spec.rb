require 'rails_helper'

RSpec.describe "/recipes", type: :request do
  let(:user) {create(:user)}
  let!(:recipe){create(:recipe, user: user) }

  describe "GET /recipes and GET /recipe/ID" do

    it "opens recipe list" do
      get recipe_list_path
      expect(response.status).to eq(204)
    end

    it "opens recipe page with specific ID" do
      get recipe_item_path, :params => {id: recipe.id}
      expect(response.status).to eq(302)
    end
  end

  describe 'functionality' do
    xit 'allows the user to add a recipe' do
      count = Recipe.count
      post add_recipe_path, :params => {recipe: {title: recipe.title, body: recipe.body, ingredients: recipe.ingredients}}
      expect(Recipe.count).to eq(count + 1)
    end
    
    it 'checks for the get recipe' do
      get edit_recipe_path
      expect(response.status).to eq(204)
    end

    it 'allows the user to edit a recipe' do
      post edit_recipe_path, :params => {recipe: {id: recipe.id, title: 'New title after edit'}}
      expect((Recipe.find_by(id: recipe.id)).title == 'New title after edit') .to eq(true)
    end

    it 'allows the user to delete a recipe' do
      post delete_recipe_path, :params => {recipe: {id: recipe.id}}
      expect(Recipe.exists?(id: recipe.id)) .to eq(false)
    end
  end

  describe 'User functionalities in recipe page' do
    xit 'User adds recommendation' do
      session[:user_id] = recipe.user_id
      patch recommend_path, :params => {recipe: {id: recipe.id, user_id: recipe.user_id}}
      recommendation =  Recipe.find_by(id: recipe.id).recommendations
      expect(recommendation).to eq(recommendation + 1)
    end
  end
end
