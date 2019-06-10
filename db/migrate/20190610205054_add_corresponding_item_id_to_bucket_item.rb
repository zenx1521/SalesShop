class AddCorrespondingItemIdToBucketItem < ActiveRecord::Migration[5.2]
  def change
    add_column :bucket_items, :corresponding_item_id, :integer
  end
end
