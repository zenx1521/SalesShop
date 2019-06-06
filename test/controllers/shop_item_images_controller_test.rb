require 'test_helper'

class ShopItemImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_item_image = shop_item_images(:one)
  end

  test "should get index" do
    get shop_item_images_url
    assert_response :success
  end

  test "should get new" do
    get new_shop_item_image_url
    assert_response :success
  end

  test "should create shop_item_image" do
    assert_difference('ShopItemImage.count') do
      post shop_item_images_url, params: { shop_item_image: { picture_path: @shop_item_image.picture_path, shop_item_id: @shop_item_image.shop_item_id } }
    end

    assert_redirected_to shop_item_image_url(ShopItemImage.last)
  end

  test "should show shop_item_image" do
    get shop_item_image_url(@shop_item_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_item_image_url(@shop_item_image)
    assert_response :success
  end

  test "should update shop_item_image" do
    patch shop_item_image_url(@shop_item_image), params: { shop_item_image: { picture_path: @shop_item_image.picture_path, shop_item_id: @shop_item_image.shop_item_id } }
    assert_redirected_to shop_item_image_url(@shop_item_image)
  end

  test "should destroy shop_item_image" do
    assert_difference('ShopItemImage.count', -1) do
      delete shop_item_image_url(@shop_item_image)
    end

    assert_redirected_to shop_item_images_url
  end
end
