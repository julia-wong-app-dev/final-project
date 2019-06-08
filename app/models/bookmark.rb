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
    
    def listings_with_bookmarks
        return Listings.where(:listing_id => self.listing_id)
    end
    
end
