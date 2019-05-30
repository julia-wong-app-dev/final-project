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
end
