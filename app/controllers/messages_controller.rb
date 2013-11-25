class MessagesController < ApplicationController

  def create
    @user = current_user
    chat = Chat.find(params[:chat_id])
    # binding.pry
    chat.messages.build(content: params[:content], to: User.find(params[:to]).name, from: User.find(params[:from]).name)
    if chat.save
      redirect_to likes_show_path
    else
      render text: "errorrrr"
    end
  end

end
