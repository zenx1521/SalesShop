class ShopItemImagesController < ApplicationController
  before_action :set_shop_item_image, only: [:show, :edit, :update, :destroy]

  # GET /shop_item_images
  # GET /shop_item_images.json
  def index
    @shop_item_images = ShopItemImage.all
  end

 
  # GET /shop_item_images/1
  # GET /shop_item_images/1.json
  def show
  end

  # GET /shop_item_images/new
  def new
    @shop_item_image = ShopItemImage.new
  end

  # GET /shop_item_images/1/edit
  def edit
  end

  # POST /shop_item_images
  # POST /shop_item_images.json
  def create
    @shop_item_image = ShopItemImage.new(shop_item_image_params)

    respond_to do |format|
      if @shop_item_image.save
        format.html { redirect_to @shop_item_image, notice: 'Shop item image was successfully created.' }
        format.json { render :show, status: :created, location: @shop_item_image }
      else
        format.html { render :new }
        format.json { render json: @shop_item_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shop_item_images/1
  # PATCH/PUT /shop_item_images/1.json
  def update
    respond_to do |format|
      if @shop_item_image.update(shop_item_image_params)
        format.html { redirect_to @shop_item_image, notice: 'Shop item image was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop_item_image }
      else
        format.html { render :edit }
        format.json { render json: @shop_item_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_item_images/1
  # DELETE /shop_item_images/1.json
  def destroy
    @shop_item_image.destroy
    respond_to do |format|
      format.html { redirect_to shop_item_images_url, notice: 'Shop item image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_item_image
      @shop_item_image = ShopItemImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_item_image_params
      params.require(:shop_item_image).permit(:shop_item_id, :picture_path)
    end
end
