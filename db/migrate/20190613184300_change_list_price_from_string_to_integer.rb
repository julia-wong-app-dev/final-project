class ChangeListPriceFromStringToInteger < ActiveRecord::Migration[5.1]
  def up
    change_column :listings, :monthly_price, 'integer USING CAST("monthly_price" AS integer)'
  end
  
  def down
    change_column :listings, :monthly_price, :string
  end
end
