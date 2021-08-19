require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "Should be able to open the Signup page" do
      get "/signup"
      expect(response).to 
    end
  end
end
