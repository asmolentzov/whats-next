class Item < ApplicationRecord
  validates_presence_of :name, :type
  
  enum type: [:band, :movie, :show, :podcast, :book, :author, :game]
end