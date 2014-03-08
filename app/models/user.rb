class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :likes
  has_many :liked_users, :through => :likes
  has_many :inverse_likes, :class_name => "Like", :foreign_key => "liked_user_id"
  has_many :inverse_liked_users, :through => :inverse_likes, :source => :user
  has_many :messages, :through => :chats
  has_many :items
  has_and_belongs_to_many :neighborhoods

  validates :username, uniqueness: {case_sensitive: false }
  # validates :name, presence: true, length: { maximum: 50 }
  # validates :email, presence:   true,
  #                   format:     { with: VALID_EMAIL_REGEX },
  #                   uniqueness: { case_sensitive: false }
  # before_save { self.email = email.downcase }

  def to_param
    username
  end

  def mutually_liked_users
    self.inverse_liked_users.select {
      |user| self.liked_users.include?(user) }
  end

  def empty_wagon?
    empty = true
    self.items.each do |item|
      empty = false if !item.photo_file_name.nil?
    end
    empty
  end

  def self.from_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.username = "user#{user.provider}#{user.id}-#{user.uid}"

      user.neighborhoods = [Neighborhood.find_by(:name => "Brooklyn")]
      5.times {user.items.build}
      user.save!
    end
  end
end
