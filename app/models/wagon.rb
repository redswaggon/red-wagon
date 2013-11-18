class Wagon < ActiveRecord::Base
  has_and_belongs_to_many :neighborhoods
  has_many :items
  has_many :likes
end
