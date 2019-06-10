# == Schema Information
#
# Table name: bookmarks
#
#  id           :integer          not null, primary key
#  sublessee_id :integer
#  listing_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Bookmark < ApplicationRecord
    validates :sublessee_id, :presence => true
    validates :listing_id, :presence => true
    
    belongs_to :sublessee, :class_name => "User"
    belongs_to :listing
    
    after_save :update_listing_bookmark_count
    after_destroy :update_listing_bookmark_count
    
    def listings_with_bookmarks
        return Listings.where(:listing_id => self.listing_id)
    end
    
    def update_listing_bookmark_count
        listing = self.listing
        listing.bookmark_count=listing.bookmarks.count
        listing.save
    end
    
end
