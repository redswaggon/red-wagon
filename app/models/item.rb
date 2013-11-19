class Item < ActiveRecord::Base
  belongs_to :user
  attr_accessible :photo
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
    default_url: "assets/images/missing.png"
  }
end
