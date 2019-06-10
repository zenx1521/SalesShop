class AddBucketIdToBucketItem < ActiveRecord::Migration[5.2]
  def change
    add_column :bucket_items, :bucket_id, :integer
  end
end
