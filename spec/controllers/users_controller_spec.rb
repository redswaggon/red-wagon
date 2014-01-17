require 'spec_helper'

describe UsersController do

  describe "GET #index" do
    context "not logged in" do
      it "redirects back to login page" do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    # context "logged in" do
      # sessions[:user_id] = 1
    # end
  end

end