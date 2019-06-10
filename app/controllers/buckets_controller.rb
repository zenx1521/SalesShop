class BucketsController < ApplicationController
  def realize_payments 
    if current_user.balance < current_user.bucket.pay_amount
      flash[:payment_error] = "You have no enough money on your account to realize transactions"
    else 
      current_user.bucket.bucket_items.each do |bucket_item|
        ActiveRecord::Base.transaction do 
          new_account_balance = current_user.balance - bucket_item.price 
          current_user.update_attributes(:balance => new_account_balance)
          corresponding_item = ShopItem.find(bucket_item.corresponding_item_id)
          seller = corresponding_item.user
          new_seller_account_balance = seller.balance + bucket_item.price
          seller.update_attributes(:balance => new_seller_account_balance)
          new_shop_item_amount = corresponding_item.amount - bucket_item.amount
          corresponding_item.update_attributes(:amount => new_shop_item_amount)
          new_buyer_pay_amount = current_user.bucket.pay_amount - bucket_item.price
          current_user.bucket.update_attributes(:pay_amount => new_buyer_pay_amount)
          bucket_item.destroy 
        end 
      end 
      respond_to do |format|
        format.js {render inline: "location.reload()"}
      end 
    end 
  end 
end
