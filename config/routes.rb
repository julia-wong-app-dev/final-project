Rails.application.routes.draw do
  
  devise_for :users
  
  # Routes for the Photo resource:

  # CREATE
  match("/new_photo_form", { :controller => "photos", :action => "blank_form", :via => "get" })
  match("/insert_photo_record", { :controller => "photos", :action => "save_new_info", :via => "post" })

  # READ
  match("/photos", { :controller => "photos", :action => "list", :via => "get" })
  match("/photos/:id_to_display", { :controller => "photos", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_photo_form/:id_to_prefill", { :controller => "photos", :action => "prefilled_form", :via => "get" })
  match("/update_photo_record/:id_to_modify", { :controller => "photos", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_photo/:id_to_remove", { :controller => "photos", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Bookmark resource:

  # CREATE
  match("/new_bookmark_form", { :controller => "bookmarks", :action => "blank_form", :via => "get" })
  match("/insert_bookmark_record", { :controller => "bookmarks", :action => "save_new_info", :via => "post" })

  # READ
  match("/bookmarks", { :controller => "bookmarks", :action => "list", :via => "get" })
  match("/bookmarks/:id_to_display", { :controller => "bookmarks", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_bookmark_form/:id_to_prefill", { :controller => "bookmarks", :action => "prefilled_form", :via => "get" })
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

  # UPDATE
  match("/existing_listing_form/:id_to_prefill", { :controller => "listings", :action => "prefilled_form", :via => "get" })
  match("/update_listing_record/:id_to_modify", { :controller => "listings", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_listing/:id_to_remove", { :controller => "listings", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the User resource:
  
  # CREATE
  
  # READ
  match("/users/:id_to_display", { :controller => "users", :action => "details", :via => "get" })
  
  # UPDATE
  
  # DELETE
  
  #------------------------------
  
  # Route to home page
  
  match("/", { :controller => "listings", :action => "list", :via => "get" })
  
  #------------------------------
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
