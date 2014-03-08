class ChatsController < ApplicationController

  def index
    @user = current_user
    @chats = Chat.find_all_chats(@user)
  end

  def show
    @user = current_user
    @chat = Chat.find(params[:id])
  end
end
