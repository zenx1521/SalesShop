class Bucket < ApplicationRecord
  belongs_to :user 
  has_many :bucket_items
end
