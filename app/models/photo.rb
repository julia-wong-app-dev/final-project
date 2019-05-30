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
end
