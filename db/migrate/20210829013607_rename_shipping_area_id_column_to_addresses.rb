class RenameShippingAreaIdColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :prefecture_id, :prefecture_id
  end
end
