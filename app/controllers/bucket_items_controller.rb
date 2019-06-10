class BucketItemsController < ApplicationController
  def create
    shop_item = ShopItem.find(params[:item_id])
    bucket_item = BucketItem.new(:title => shop_item.title, :amount => params[:amount],:price => params[:amount].to_i*shop_item.price,:bucket_id => current_user.bucket.id,:corresponding_item_id => shop_item.id)
    if bucket_item.save
      new_pay_amount = current_user.bucket.pay_amount + bucket_item.price
      current_user.bucket.update_attributes(:pay_amount => new_pay_amount)
      flash[:bucket_item_info] = "Item was successfully added to your bucket"
      respond_to do |format|
        format.js {render inline: "location.reload()"}
      end 
    end
  end 

  def destroy
    bucket_item = BucketItem.find(params[:id])
    new_pay_amount = current_user.bucket.pay_amount - bucket_item.price
    if current_user.bucket.update_attributes(:pay_amount => new_pay_amount)
      bucket_item.destroy   
      flash[:bucket_item_info] = "Item was successfully deleted"
      respond_to do |format|
        format.js {render inline: "location.reload()"}
      end 
    end 
  end 
end
