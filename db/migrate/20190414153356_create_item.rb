class CreateItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :item_type
      t.string :wikipedia_teaser
      t.string :wikipedia_url
      t.string :youtube_url
      t.string :youtube_id
      
      t.timestamps
    end
  end
end
