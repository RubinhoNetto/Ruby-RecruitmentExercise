require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
   context "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template :index
    end
  end

   context "#feth_data" do
    it "redirect to index" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template :index
    end
  end
end

