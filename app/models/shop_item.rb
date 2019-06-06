class ShopItem < ApplicationRecord
    has_many :shop_item_images, dependent: :destroy
    belongs_to :user
    accepts_nested_attributes_for :shop_item_images 
    scope :choosen_category, -> (choosen_category) {where category: choosen_category}
    scope :choosen_min_price, -> (choosen_min_price) {where("price > ?",choosen_min_price)}
    scope :choosen_max_price, -> (choosen_max_price) {where("price < ?",choosen_max_price)}
end 
