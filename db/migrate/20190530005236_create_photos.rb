class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :photo_caption
      t.integer :listing_id
      t.string :url

      t.timestamps
    end
  end
end
