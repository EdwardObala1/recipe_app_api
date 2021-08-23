require 'rails_helper'

RSpec.describe "Recipe", type: :request do
  describe "GET /recipe and GET /recipe/ID" do
    it "opens recipe list" do
      # get recipe_path
      # expect(response.status).to eq(204)
    end
    it "opens recipe page with specific ID"
  end

  describe 'functionality' do
    it 'allows the user to add a recipe'
    it 'allows the user to edit a recipe'
    it 'allows the user to delete a recipe'
  end

  describe 'Usser end' do
    it 'User adds recommendation'
  end
end
