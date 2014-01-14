class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :liked_user, :class_name => "User", foreign_key: "liked_user_id"

  def self.already_liked?(user_id, stranger_id)
    !Like.where(user_id: user_id, liked_user_id: stranger_id).empty?
  end
end
