require 'spec_helper'

describe UsersController do
  shared_examples("public access to site") do
    describe "GET #index" do
      it "redirects to sessions#new (root)" do
        get :index
        expect(response).to require_login
      end
    end

    describe "GET #show" do
      it "redirects to sessions#new (root)" do
        get :show
        expect(response).to require_login
      end
    end

    # Not using this route
    # describe "post #create" do
    #   it "redirects to sessions#new (root)" do
    #     expect{
    #       post :create, user: attributes_for(:user)
    #     }.to render_template :error
    #   end
    # end
  end

  shared_examples("user access to site") do
    describe "full logged-in user access" do
      before :each do
        @user = create(:user)
        set_user_session(@user)
      end

      describe "GET #index" do
        it "redirects to users#show" do
          get :index
          expect(response).to redirect_to user_path(@user)
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
          get :edit, username: @user
          expect(assigns(:user)).to eq @user 
        end

        it "renders the :edit template" do
          get :edit, username: @user
          expect(response).to render_template :edit 
        end
      end

      describe "GET #show" do
        it "assigns the current user to @user" do
          get :show, username: @user
          expect(assigns(:user)).to eq @user 
        end

        it "renders the :show template" do
          get :show, username: @user
          expect(response).to render_template :show 
        end
      end

      describe "GET #random_wagon_nearby" do
        context "there are non-empty wagons in user's neighborhood" do
          before :each do
            @user2 = create(:user)
            @bk = create(:neighborhood)
            @user.neighborhoods << @bk
            @user2.neighborhoods << @bk
            @user2.items.create(photo_file_name: "test_file")
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
            @bk = create(:neighborhood)
            @user.neighborhoods << @bk
            get :random_wagon_nearby, username: @user
            expect(response).to render_template :error2
          end
        end
      end

      # describe "POST #create" do
      #   before :each do
      #     @bk = create(:neighborhood)
      #   end

      #   it "saves the new user to the database" do
      #     expect{
      #       post :create, user: attributes_for(:user), neighborhood: {neighborhoods: 1}
      #     }.to change(User, :count).by(1)
      #   end

      #   it "redirects to users#show"
      # end

      describe "PUT #update" do
        before :each do
          @bw = create(:neighborhood)
        end
        
        it "located the requested user" do
          put :update, username: @user, user: attributes_for(:user, username: "Bobby"), neighborhood: { neighborhoods: @bw.id }
          expect(assigns(:user)).to eq @user
        end

        it "changes the user's attributes" do
          put :update, username: @user, user: attributes_for(:user, username: "Bobby"), neighborhood: { neighborhoods: @bw.id }
          @user.reload
          expect(@user.username).to eq "Bobby"
        end

        it "redirects to the updated contact's #show path" do
          put :update, username: @user, user: attributes_for(:user, username: "Bobby"), neighborhood: { neighborhoods: @bw.id }
          @user.reload
          expect(response).to redirect_to @user
        end
      end

      describe "DELETE #destroy" do
        it "deletes the user" do
          expect{
            delete :destroy, username: @user
          }.to change(User, :count).by(-1)
        end

        it "redirects to root url sessions#new" do
          delete :destroy, username: @user
          expect(response).to redirect_to root_url
        end
      end
    end
  end

  describe "guest access" do
    it_behaves_like "public access to site"
  end

  describe "user access" do
    it_behaves_like "user access to site"
  end

end