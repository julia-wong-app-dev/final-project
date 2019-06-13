class ChangeListPriceFromStringToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :listings, :monthly_price, :integer
  end
end
