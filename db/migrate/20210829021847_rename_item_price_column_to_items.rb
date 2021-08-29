class RenameItemPriceColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :item_price, :price
  end
end
