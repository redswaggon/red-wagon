class LikesController < ApplicationController

  def create
    @user = current_user
    l = Like.new
    l.user_id = @user.id
    l.liked_user = User.find_by(:id => params[:stranger])
    if l.save
    # if Like.create(user_id: @user.id, liked_user: params[:stranger])
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

