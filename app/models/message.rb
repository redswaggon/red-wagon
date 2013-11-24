class Message < ActiveRecord::Base
  belongs_to :chat
  belongs_to :user, :through => :chats 
end
