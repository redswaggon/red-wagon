class ChatsController < ApplicationController

  def create
    if !Chat.where(user_id:  current_user.id, chatted_user_id: params[:id]).empty?
    else Chat.create(user_id:  current_user.id, chatted_user_id: params[:id])
    end
    redirect_to show_chats_path
  end


  def show
    @user = current_user
    @chats = @user.chats
  end

end
