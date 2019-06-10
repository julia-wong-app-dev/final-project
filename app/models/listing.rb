# == Schema Information
#
# Table name: listings
#
#  id                  :integer          not null, primary key
#  housing_type        :string
#  city                :string
#  neighborhood        :string
#  number_of_guests    :integer
#  number_of_bedrooms  :float
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
#  bookmark_count      :integer          default(0)
#

class Listing < ApplicationRecord
    validates :sublessor_id, :presence => true
    validates :housing_type, :presence => true
    validates :city, :presence => true
    validates :neighborhood, :presence => true
    validates :number_of_guests, :presence => true
    validates :number_of_bedrooms, :presence => true
    validates :number_of_bathrooms, :presence => true
    validates :state, :presence => true
    validates :country, :presence => true
    validates :amenities, :presence => true
    validates :description, :presence => true
    validates :sublessor_id, :presence => true
    validates :available_from, :presence => true
    validates :available_till, :presence => true
    validates :zip_code, :presence => true
    
    belongs_to :sublessor, :class_name => "User"
    has_many :photos, :dependent => :destroy
    has_many :bookmarks, :dependent => :destroy

    has_many :interested_sublessees, :through => :bookmarks, :source => :sublessee
    
    def Listing.by_popularity
        # return Bookmark.where(:listing_id => self.id)
        listings = Listing.all
        popularity_hash = {}
        
        listings.each do |listing|
           popularity_hash[listing] = Bookmark.where({:listing_id => listing.id}).count 
        end
        
        # @users = User.includes(:user_extension).order("user_extensions.company desc")
        # "count(jobs.company_id) desc"
    end
    
end
