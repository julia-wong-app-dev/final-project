# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  employer_or_school     :string
#  linkedin_url           :string
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :email, :presence => true
  validates :employer_or_school, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
         
  has_many :listings, :foreign_key => "sublessor_id", :dependent => :destroy
  has_many :bookmarks, :foreign_key => "sublessee_id", :dependent => :destroy
  
  has_many :bookmarked_listings, :through => :bookmarks, :source => :listing
  has_many :potential_sublessors, :through => :bookmarked_listings, :source => :sublessor
  has_many :potential_sublessees, :through => :listings, :source => :interested_sublessees
  
#  def bookmarked_listings
#    @user = User.where({ :id => params.fetch("id") }).at(0)

#    @listings = @user.bookmarked_listings.order({ :created_at => :desc })

#    render("user_templates/bookmarked.html.erb")
#  end
  
end
