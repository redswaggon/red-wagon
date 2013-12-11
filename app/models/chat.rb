class Chat < ActiveRecord::Base
  has_many :messages
  belongs_to :user
  belongs_to :chatted_user, :class_name => "User", foreign_key: "chatted_user_id"

  validates :user_id, presence: true
  validates :chatted_user_id, presence: true
end