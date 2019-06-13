class ChangeListPriceFromStringToInteger < ActiveRecord::Migration[5.1]
  def up
    alter table :listings
    alter column :monthly_price
    type integer using cast(number as integer)
  end
  
  def down
    change_column :listings, :monthly_price, :string
  end
end
