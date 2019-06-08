class BookmarksController < ApplicationController
  def list
    @bookmarks = Bookmark.all

    render("bookmark_templates/list.html.erb")
  end

  def details
    @bookmark = Bookmark.where({ :id => params.fetch("id_to_display") }).first

    render("bookmark_templates/details.html.erb")
  end

  def blank_form
    @bookmark = Bookmark.new

    render("bookmark_templates/blank_form.html.erb")
  end

  def save_new_info
    @bookmark = Bookmark.new

    @bookmark.sublessee_id = params.fetch("sublessee_id")
    @bookmark.listing_id = params.fetch("listing_id")

    if @bookmark.valid?
      @bookmark.save

      redirect_to("/listings/" + @bookmark.listing_id.to_s, { :notice => "Bookmark created successfully." })
    else
      render("bookmark_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @bookmark = Bookmark.where({ :id => params.fetch("id_to_prefill") }).first

    render("bookmark_templates/prefilled_form.html.erb")
  end

  def save_edits
    @bookmark = Bookmark.where({ :id => params.fetch("id_to_modify") }).first

    @bookmark.sublessee_id = params.fetch("sublessee_id")
    @bookmark.listing_id = params.fetch("listing_id")

    if @bookmark.valid?
      @bookmark.save

      redirect_to("/bookmarks/" + @bookmark.id.to_s, { :notice => "Bookmark updated successfully." })
    else
      render("bookmark_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @bookmark = Bookmark.where({ :id => params.fetch("id_to_remove") }).first

    @bookmark.destroy

    redirect_to("/bookmarks", { :notice => "Bookmark deleted successfully." })
  end
  
end
