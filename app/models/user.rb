class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :chats
  has_many :messages, :through => :chats
  

  has_many :likes
  has_many :liked_users, :through => :likes#, :source => :user
  has_many :inverse_likes, :class_name => "Like", :foreign_key => "liked_user_id"
  has_many :inverse_liked_users, :through => :inverse_likes, :source => :user

  has_many :items
  accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes['photo'].blank? }, allow_destroy: true
  before_save { self.email = email.downcase }

  has_and_belongs_to_many :neighborhoods

  has_secure_password
  # validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, :if => :password
  validates :password_confirmation, presence: true, :if => :password_confirmation

  def to_param
    username
  end

  def self.mutually_liked_users(curr_user)
    curr_user.inverse_liked_users.select {
      |user| curr_user.liked_users.include?(user) }
  end


  # def self.create_chat
  #   self.mutually_liked_users.each do |user|
  #     new_chat = user.chats.build(user_id: current_user.id)
  #     new_chat.messages.build
  #     user.likes.each do |like|
  #       Chat.new if like.liked_user_id == current_user.id
  #     end
  #   end
  # end

end


  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     user.oauth_token = auth.credentials.token
  #     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     user.save!
  #   end
  # end
