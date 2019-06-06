class ListingsController < ApplicationController
  
  skip_before_action :authenticate_user!, {:only => :list}
  
  def list
    @listings = Listing.all

    render("listing_templates/list.html.erb")
  end

  def details
    @listing = Listing.where({ :id => params.fetch("id_to_display") }).first

    render("listing_templates/details.html.erb")
  end

  def blank_form
    @listing = Listing.new

    render("listing_templates/blank_form.html.erb")
  end

  def save_new_info
    @listing = Listing.new

    @listing.housing_type = params.fetch("housing_type")
    @listing.city = params.fetch("city")
    @listing.neighborhood = params.fetch("neighborhood")
    @listing.number_of_guests = params.fetch("number_of_guests")
    @listing.number_of_bedrooms = params.fetch("number_of_bedrooms")
    @listing.number_of_bathrooms = params.fetch("number_of_bathrooms")
    @listing.state = params.fetch("state")
    @listing.country = params.fetch("country")
    @listing.amenities = params.fetch("amenities")
    @listing.description = params.fetch("description")
    @listing.monthly_price = params.fetch("monthly_price")
    @listing.sublessor_id = params.fetch("sublessor_id")
    @listing.available_from = params.fetch("available_from")
    @listing.available_till = params.fetch("available_till")
    @listing.zip_code = params.fetch("zip_code")

    if @listing.valid?
      @listing.save

      redirect_to("/listings", { :notice => "Listing created successfully." })
    else
      render("listing_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @listing = Listing.where({ :id => params.fetch("id_to_prefill") }).first

    render("listing_templates/prefilled_form.html.erb")
  end

  def save_edits
    @listing = Listing.where({ :id => params.fetch("id_to_modify") }).first

    @listing.housing_type = params.fetch("housing_type")
    @listing.city = params.fetch("city")
    @listing.neighborhood = params.fetch("neighborhood")
    @listing.number_of_guests = params.fetch("number_of_guests")
    @listing.number_of_bedrooms = params.fetch("number_of_bedrooms")
    @listing.number_of_bathrooms = params.fetch("number_of_bathrooms")
    @listing.state = params.fetch("state")
    @listing.country = params.fetch("country")
    @listing.amenities = params.fetch("amenities")
    @listing.description = params.fetch("description")
    @listing.monthly_price = params.fetch("monthly_price")
    @listing.sublessor_id = params.fetch("sublessor_id")
    @listing.available_from = params.fetch("available_from")
    @listing.available_till = params.fetch("available_till")
    @listing.zip_code = params.fetch("zip_code")

    if @listing.valid?
      @listing.save

      redirect_to("/listings/" + @listing.id.to_s, { :notice => "Listing updated successfully." })
    else
      render("listing_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @listing = Listing.where({ :id => params.fetch("id_to_remove") }).first

    @listing.destroy

    redirect_to("/listings", { :notice => "Listing deleted successfully." })
  end
  
  def most_bookmarked
    @listing = Listing.all.order({ :likes_count => :desc }).limit(25)

    render("listing_templates/bookmarked_list.html.erb")
  end
end
