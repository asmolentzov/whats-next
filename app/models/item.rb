class Item < ApplicationRecord
  validates_presence_of :name, :type
end