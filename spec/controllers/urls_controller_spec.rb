require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let( :valid_params )          { {long_url: "http://example.com"} }
    let( :invalid_params )        { {long_url: "google"} }

    context "when valid params" do
      it "should save url" do
        post:create, valid_params
        expect(Url.find_by(valid_params)).not_to eq nil
      end

      it "should redirect to #index" do
        post :create, valid_params
        expect(response).to redirect_to( urls_path )
      end
    end

    context "when invalid params" do
      it "should rerender submission page" do
        post :create, invalid_params
        expect(Url.find_by(valid_params)).to eq nil
      end

      it "should render with generated errors" do
        post :create, invalid_params
        expect(assigns(:errors)).not_to eq nil
      end
    end
  end
end
