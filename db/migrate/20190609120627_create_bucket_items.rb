class CreateBucketItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bucket_items do |t|
      t.string :title
      t.integer :price
      t.integer :amount

      t.timestamps
    end
  end
end
