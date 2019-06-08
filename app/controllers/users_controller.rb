class UsersController < ApplicationController
  def details
    @user = User.where({ :id => params.fetch("id_to_display") }).first
    @listings = @user.listings.order({ :created_at => :desc })
    
    render("user_templates/details.html.erb")
  end
  
  def bookmarked
    @user = User.where({ :id => params.fetch("id") }).at(0)

    @listings = @user.bookmarks.order({ :created_at => :desc })

    render("user_templates/bookmarked")
  end

end