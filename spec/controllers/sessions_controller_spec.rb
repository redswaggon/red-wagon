require 'spec_helper'

describe SessionsController do
  describe "GET #new" do
    it "renders the :new view" do
      get :new
      expect(response).to render_template :new
    end
  end
end