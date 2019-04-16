class Item < ApplicationRecord
  validates_presence_of :name, :item_type
  
  has_many :user_items
  
  enum item_type: [:music, :movie, :show, :podcast, :book, :author, :game]
end