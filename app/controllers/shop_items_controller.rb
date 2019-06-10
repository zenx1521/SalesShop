class ShopItemsController < ApplicationController
    before_action :authenticate_user!
    def new
        @shop_item = current_user.shop_items.new 
        @shop_item_image = @shop_item.shop_item_images.build 
    end
    def search
        respond_data = ShopItem.where(nil)
        puts filtering_params
        filtering_params.each do |key,value|
            respond_data = respond_data.public_send(key, value) if value.present?
        end
        respond_to do |format|
            format.html { render :json => respond_data.to_json(:include => [:shop_item_images])}
        end
    end 
    def create
        @shop_item = current_user.shop_items.new(item_params)

        if @shop_item.save
            
            if !params[:shop_item][:shop_item_image].blank?

                params[:shop_item][:shop_item_image][:picture_path].each do |a|
                    @shop_item_image = @shop_item.shop_item_images.create!(:picture_path => a, :shop_item_id => @shop_item.id)
                end
            end
            redirect_to shop_item_path(@shop_item.id)
        end 
    end

    def show 
        @shop_item = current_user.shop_items.find(params[:id])
        @shop_item_images = @shop_item.shop_item_images.all
    end 
    def edit
        @shop_item = current_user.shop_items.find(params[:id ])
    end 

    def update 
        @shop_item = current_user.shop_items.find(params[:id])
        @shop_item.update(item_params)
        puts params[:shop_item][:shop_item_image]
        if params[:delete].present?
            params[:delete].each do |p|

               current_user.shop_items.shop_item_images.find(p[0]).destroy
            end 
        end 
        if !params[:shop_item][:shop_item_image].blank?
            params[:shop_item][:shop_item_image][:picture_path].each do |a|
                @shop_item_image = @shop_item.shop_item_images.create!(:picture_path => a, :shop_item_id => @shop_item.id)
            end
        end
        redirect_to shop_item_path(@shop_item)
        
    end 

    def destroy 
        @shop_item = current_user.shop_items.find(params[:id])

        @shop_item.destroy 

        redirect_to root_path
    end 

    def index
        #@shop_items = current_user.shop_items.all 
        @shop_items = ShopItem.all

        respond_to do |format|
            format.html
            format.json { render :json => @shop_items.to_json(:include => [:shop_item_images]) }
        end  
    end

    private 
    def item_params
        params.require(:shop_item).permit(:price,:description,:title,:category,:amount)
    end

    def filtering_params
        params[:shop_item_data].slice(:choosen_category,:choosen_min_price,:choosen_max_price)
    end 
end
