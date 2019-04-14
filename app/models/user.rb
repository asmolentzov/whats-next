class User < ApplicationRecord
  validates_presence_of :name
  
  has_many :user_items
  has_many :items, through: :user_items
end