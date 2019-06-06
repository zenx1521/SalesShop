class CreateShopItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_items do |t|
      t.integer :price
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
