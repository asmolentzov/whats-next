class Item < ApplicationRecord
  validates_presence_of :name, :item_type
  
  has_many :user_items
  
  enum item_type: [:band, :movie, :show, :podcast, :book, :author, :game, :music]
end