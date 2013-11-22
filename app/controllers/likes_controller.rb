class LikesController < ApplicationController
  # before_action :set_user, except: [:create]

  def create
    if Like.create(user_id: params[:user], liked_user: params[:stranger])
      msg = "Liked!"
    else
      msg = "failed :("
    end
    response = {
      message: msg
    }
    render json: response
  end

  def show
    @user = current_user
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_digest)
  end

end

