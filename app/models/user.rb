class User < ApplicationRecord
  validates_presence_of :name
  
  has_many :user_items
  has_many :items, through: :user_items
  has_many :user_likes
  has_many :likes, through: :user_likes
  
  has_secure_password
end