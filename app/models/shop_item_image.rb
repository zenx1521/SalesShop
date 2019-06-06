class ShopItemImage < ApplicationRecord
    mount_uploader :picture_path, ShopPictureUploader
    belongs_to :shop_item
end
