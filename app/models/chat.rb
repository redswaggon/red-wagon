class Chat < ActiveRecord::Base
  has_many :messages
  has_and_belongs_to_many :users

  def self.create_chats(current_user)
    User.mutually_liked_users(current_user).each do |user|
      new_chat = user.chats.build(user_id: current_user.id)
      user.likes.map do |like| 
        new_chat.user_id << like.user_id if like.liked_user_id == current_user.id
      end
      new_message = new_chat.messages.build(content: "This is a new chat")
      new_chat.save
      new_message.save
    end
  end
end


# user.likes.each do |like| 
      #   liked_user_id = like.id if like.liked_user_id == current_user.id

    #   user.likes.each do |like|
    #     Chat.new if like.liked_user_id == current_user.id

    # 