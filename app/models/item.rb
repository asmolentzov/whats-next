class Item < ApplicationRecord
  validates_presence_of :name, :type
  
  has_many :user_items
  
  enum type: [:band, :movie, :show, :podcast, :book, :author, :game]
end