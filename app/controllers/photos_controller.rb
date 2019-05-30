class PhotosController < ApplicationController
  def list
    @photos = Photo.all

    render("photo_templates/list.html.erb")
  end

  def details
    @photo = Photo.where({ :id => params.fetch("id_to_display") }).first

    render("photo_templates/details.html.erb")
  end

  def blank_form
    @photo = Photo.new

    render("photo_templates/blank_form.html.erb")
  end

  def save_new_info
    @photo = Photo.new

    @photo.photo_caption = params.fetch("photo_caption")
    @photo.listing_id = params.fetch("listing_id")
    @photo.url = params.fetch("url")

    if @photo.valid?
      @photo.save

      redirect_to("/photos", { :notice => "Photo created successfully." })
    else
      render("photo_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @photo = Photo.where({ :id => params.fetch("id_to_prefill") }).first

    render("photo_templates/prefilled_form.html.erb")
  end

  def save_edits
    @photo = Photo.where({ :id => params.fetch("id_to_modify") }).first

    @photo.photo_caption = params.fetch("photo_caption")
    @photo.listing_id = params.fetch("listing_id")
    @photo.url = params.fetch("url")

    if @photo.valid?
      @photo.save

      redirect_to("/photos/" + @photo.id.to_s, { :notice => "Photo updated successfully." })
    else
      render("photo_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @photo = Photo.where({ :id => params.fetch("id_to_remove") }).first

    @photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully." })
  end
end
