class Chat < ActiveRecord::Base
  has_many :messages
  belongs_to :user
  belongs_to :chatted_user, :class_name => "User", foreign_key: "chatted_user_id"
end



  # def self.create_chat(current_user,liked_user_id)
  #   new_chat = Chat.new
  #   User.mutually_liked_users(current_user).collect do |user|
  #     new_chat.user_ids << user.id if user.id = (liked_user_id)
  #   end
  #   new_chat.save

  # end
      




      # i want to create a new chat with the current user and the liked user as user_ids in an array





      # new_chat = user.chats.build(user_id: current_user.id)
      # user.likes.map do |like| 
      #   new_chat.user_id << like.user_id if like.liked_user_id == current_user.id
      # end
      # new_message = new_chat.messages.build(content: "This is a new chat")
      # new_chat.save
      # new_message.save
#     end
#   end
# end

#   current_user.inverse_liked_users.select do |user| 
#     current_user.liked_users.include?(user)

