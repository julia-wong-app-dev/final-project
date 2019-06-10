class AddBookmarkCountToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :bookmark_count, :integer, default:0
  end
end
