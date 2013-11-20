class Item < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    default_url: '/missing.png'
  }
  # validates_attachment :photo, content_type: { content_type: "image/jpg" }
end
