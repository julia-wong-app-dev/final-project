# == Schema Information
#
# Table name: photos
#
#  id            :integer          not null, primary key
#  photo_caption :string
#  listing_id    :integer
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Photo < ApplicationRecord
    validates :listing_id, :presence => true
    
    belongs_to :listing
    
    # Addition for Image Upload
#    mount_uploader :url, url_uploader
    
end
