class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.integer :sublessee_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
