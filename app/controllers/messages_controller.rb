class MessagesController < ApplicationController

  def create
    @user = current_user
    chat = Chat.find(params[:chat_id])
    chat.messages.build(content: ("#{@user.username}: " + params[:content]), to: User.find(params[:to]).name, from: User.find(params[:from]).name)
    if chat.save
      redirect_to user_chat_path(chat)
    else
      render text: "errorrrr"
    end
  end

end
