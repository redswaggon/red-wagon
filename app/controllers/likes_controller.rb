class LikesController < ApplicationController

  def create
    if Like.already_liked?(param[:user], params[:stranger])
      message = "Already liked."
    elsif Like.create(user_id: params[:user], liked_user_id: params[:stranger])
      message = "Liked! Showing next wagon."
    end
    response = { message: message }
    render json: response
  end

  def destroy
    if Like.find(params[:id]).destroy
      message = "Deleted."
    else
      message = "Couldn't find record."
    end
    response = { message: message }
    render json: response
  end
end
