class AddAmountToShopItem < ActiveRecord::Migration[5.2]
  def change
    add_column :shop_items, :amount, :integer
  end
end
