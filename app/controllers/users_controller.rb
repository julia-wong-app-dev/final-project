class UsersController < ApplicationController
  def details
    @user = User.where({ :id => params.fetch("id_to_display") }).first

    render("users/details.html.erb")
  end

end
