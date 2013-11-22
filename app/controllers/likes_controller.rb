class LikesController < ApplicationController

  def create
    if !Like.where(user_id: params[:user], liked_user_id: params[:stranger]).empty?
      msg = "Already liked! Next!"
    elsif Like.create(user_id: params[:user], liked_user_id: params[:stranger])
      msg = "Liked!"
    else
      msg = "Could not add Like :("
    end
    response = { message: msg }
    render json: response
  end

  def show
    @user = current_user
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

