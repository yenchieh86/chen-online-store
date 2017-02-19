require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #contect" do
    it "renders to contect page" do
      get :contect
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
  
  describe "GET #help" do
    it "renders to help page" do
      get :help
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
  
  describe "GET #home" do
    it "renders to home page" do
      get :home
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
