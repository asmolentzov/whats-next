class CreateUserLike < ActiveRecord::Migration[5.2]
  def change
    create_table :user_likes do |t|
      t.belongs_to :user
      t.belongs_to :like
      t.timestamps
    end
  end
end
