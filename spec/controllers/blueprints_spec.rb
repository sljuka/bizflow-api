require 'rails_helper'

describe Api::V1::BlueprintsController do

  before :each do
    
  end

  describe "GET #index" do
    it "assigns @blueprints" do
      user = User.create(email: "pera@bizflow.com", first_name: "pera", last_name: "peric")
      get :index , token: user.api_key.token, format: :json
      expect(response).to render_template("index")
      expect(assigns(:blueprints)).to eq([])
    end
  end

end