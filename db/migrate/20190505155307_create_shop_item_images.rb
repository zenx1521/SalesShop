class CreateShopItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_item_images do |t|
      t.integer :shop_item_id
      t.string :picture_path

      t.timestamps
    end
  end
end
