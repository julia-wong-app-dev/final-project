ActiveAdmin.register Listing do
  permit_params :housing_type, :city, :neighborhood, :number_of_guests, :number_of_bedrooms, :number_of_bathrooms, :state, :country, :amenities, :description, :monthly_price, :sublessor_id, :available_from, :available_till, :zip_code

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
