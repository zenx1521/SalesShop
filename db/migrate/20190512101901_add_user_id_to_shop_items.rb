class AddUserIdToShopItems < ActiveRecord::Migration[5.2]
  def change
    add_column :shop_items, :user_id, :integer
  end
end
