# == Schema Information
#
# Table name: listings
#
#  id                  :integer          not null, primary key
#  housing_type        :string
#  city                :string
#  neighborhood        :string
#  number_of_guests    :integer
#  number_of_bedrooms  :integer
#  number_of_bathrooms :float
#  state               :string
#  country             :string
#  amenities           :string
#  description         :string
#  monthly_price       :string
#  sublessor_id        :integer
#  available_from      :datetime
#  available_till      :datetime
#  zip_code            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Listing < ApplicationRecord
    validates :sublessor_id, :presence => true
    
    belongs_to :sublessor, :class_name => "User"
    has_many :photos, :dependent => :destroy
    has_many :bookmarks, :dependent => :destroy

    has_many :interested_sublessees, :through => :bookmarks, :source => :sublessee
    
    def bookmarks
        return Bookmark.where(:listing_id => self.id)
    end
    
end
