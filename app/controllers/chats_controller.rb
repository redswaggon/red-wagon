class ChatsController < ApplicationController

  def create
    if !Chat.where(user_id:  current_user.id, chatted_user_id: params[:id]).empty?
      else current_user.create_chat(user_id:  current_user.id, chatted_user_id: params[:id])
    end
  end

  def show
    @user = current_user
    @chats = @user.chats
  end

end
