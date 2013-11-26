class LikesController < ApplicationController

  def create
    if !Like.where(user_id: params[:user], liked_user_id: params[:stranger]).empty?
    elsif Like.create(user_id: params[:user], liked_user_id: params[:stranger])
    end
  end

  def show
    @user = current_user
    @mutually_liked_users = @user.mutually_liked_users
  end

  def destroy
    if Like.find(params[:id]).destroy
      message = "Deleted."
    else
      message = "Couldn't find record."
    end
    response = { message: message }
    render json: message
  end
end