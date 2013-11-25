class ChatsController < ApplicationController
  
  def new
    Chat.create_chats(@user)
  end


  def show
    @user = current_user
    @chats = @user.chats
  end

end
