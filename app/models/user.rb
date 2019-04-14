class User < ApplicationRecord
  validates_presence_of :name
  
  has_many :user_items
end