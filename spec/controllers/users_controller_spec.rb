require 'spec_helper'

#   get '/users/random_wagon_nearby/:username' => 'users#random_wagon_nearby', as: 'random_wagon_nearby'

describe UsersController do
  describe "GET #index" do
    context "not logged in" do
      it "redirects to sessions#new (root)" do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    context "logged in" do
      it "redirects to users#show" do
        user = create(:user)
        session[:user_id] = user.id
        get :index
        expect(response).to redirect_to user_path(user)
      end
    end
  end

  describe "GET #new" do
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the current user to @user" do
      user = create(:user)
      session[:user_id] = user.id
      get :edit, username: user
      expect(assigns(:user)).to eq user 
    end

    it "renders the :edit template" do
      user = create(:user)
      session[:user_id] = user.id
      get :edit, username: user
      expect(response).to render_template :edit 
    end
  end

  describe "GET #show" do
    it "assigns the current user to @user" do
      user = create(:user)
      session[:user_id] = user.id
      get :show, username: user
      expect(assigns(:user)).to eq user 
    end

    it "renders the :show template" do
      user = create(:user)
      session[:user_id] = user.id
      get :show, username: user
      expect(response).to render_template :show 
    end
  end

  describe "GET #random_wagon_nearby" do
    context "there are non-empty wagons in user's neighborhood" do
      before :each do
        @user = create(:user)
        @user2 = create(:user)
        @bk = create(:neighborhood)
        @user.neighborhoods << @bk
        @user2.neighborhoods << @bk
        @user2.items.create(photo_file_name: "test_file")
        session[:user_id] = @user.id
      end

      it "assigns another user to @stranger" do
        get :random_wagon_nearby, username: @user
        expect(assigns(:stranger)).to eq @user2
      end

      it "renders the :random_wagon_nearby template" do
        get :random_wagon_nearby, username: @user
        expect(response).to render_template :random_wagon_nearby
      end
    end

    context "there are no filled filled wagons in user's neighborhood" do
      it "renders the :error2 template" do
        user = create(:user)
        user.neighborhoods << @bk
        session[:user_id] = user.id
        get :random_wagon_nearby, username: user
        expect(response).to render_template :error2
      end
    end
  end

  describe "POST #create" do

  end

  describe "PUT #update" do
  end

  describe "DELETE #destroy" do
  end
end