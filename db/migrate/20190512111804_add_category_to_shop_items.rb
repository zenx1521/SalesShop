class AddCategoryToShopItems < ActiveRecord::Migration[5.2]
  def change
    add_column :shop_items, :category,:string
  end
end
