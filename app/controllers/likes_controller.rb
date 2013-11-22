class LikesController < ApplicationController

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

end

