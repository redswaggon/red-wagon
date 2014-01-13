class Chat < ActiveRecord::Base
  has_many :messages
  belongs_to :user
  belongs_to :chatted_user, :class_name => "User", foreign_key: "chatted_user_id"

  validates :user_id, presence: true
  validates :chatted_user_id, presence: true

  def create_or_find(curr_user, liked_user)
    if !Chat.where("user_id = ? AND chatted_user_id = ?", curr_user.id, liked_user.id).empty?
      Chat.where("user_id = ? AND chatted_user_id = ?", curr_user.id, liked_user.id).first
    elsif !Chat.where("chatted_user_id = ? AND user_id = ?", curr_user.id, liked_user.id).empty?
      Chat.where("chatted_user_id = ? AND user_id = ?", curr_user.id, liked_user.id).first
    else
      Chat.create(user_id: curr_user.id, chatted_user_id: liked_user.id)
    end 
  end
end