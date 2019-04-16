class UserLike < ApplicationRecord
  belongs_to :user
  belongs_to :like, class_name: 'Item'
end