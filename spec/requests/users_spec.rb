require 'rails_helper'

RSpec.describe "/users", type: :request do

  describe "GET" do
    it "/signup" do
      get signup_path
      expect(response).to have_http_status(:no_content)
    end
  end
end
