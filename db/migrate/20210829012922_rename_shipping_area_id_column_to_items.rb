class RenameShippingAreaIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :prefecture_id, :prefecture_id
  end
end
