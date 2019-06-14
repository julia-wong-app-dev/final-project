Rails.application.routes.draw do
  
  devise_for :users
  

  # Routes for the Bookmark resource:

  # CREATE
  match("/insert_bookmark_record", { :controller => "bookmarks", :action => "save_new_info", :via => "get" })

  # UPDATE
  match("/update_bookmark_record/:id_to_modify", { :controller => "bookmarks", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_bookmark/:id_to_remove", { :controller => "bookmarks", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Listing resource:

  # CREATE
  match("/new_listing_form", { :controller => "listings", :action => "blank_form", :via => "get" })
  match("/insert_listing_record", { :controller => "listings", :action => "save_new_info", :via => "post" })

  # READ
  match("/listings", { :controller => "listings", :action => "list", :via => "get" })
  match("/listings/:id_to_display", { :controller => "listings", :action => "details", :via => "get" })
  match("/popular", { :controller => "listings", :action => "most_bookmarked", :via => "get" })

  # UPDATE
  match("/existing_listing_form/:id_to_prefill", { :controller => "listings", :action => "prefilled_form", :via => "get" })
  match("/update_listing_record/:id_to_modify", { :controller => "listings", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_listing/:id_to_remove", { :controller => "listings", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the User resource:
  
  # READ
  match("/users/:id_to_display", { :controller => "users", :action => "details", :via => "get" })
  
  #------------------------------
  
  # Route to home page
  
  match("/", { :controller => "listings", :action => "list", :via => "get" })
  
  #------------------------------
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
