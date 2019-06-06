require "application_system_test_case"

class ShopItemImagesTest < ApplicationSystemTestCase
  setup do
    @shop_item_image = shop_item_images(:one)
  end

  test "visiting the index" do
    visit shop_item_images_url
    assert_selector "h1", text: "Shop Item Images"
  end

  test "creating a Shop item image" do
    visit shop_item_images_url
    click_on "New Shop Item Image"

    fill_in "Picture path", with: @shop_item_image.picture_path
    fill_in "Shop item", with: @shop_item_image.shop_item_id
    click_on "Create Shop item image"

    assert_text "Shop item image was successfully created"
    click_on "Back"
  end

  test "updating a Shop item image" do
    visit shop_item_images_url
    click_on "Edit", match: :first

    fill_in "Picture path", with: @shop_item_image.picture_path
    fill_in "Shop item", with: @shop_item_image.shop_item_id
    click_on "Update Shop item image"

    assert_text "Shop item image was successfully updated"
    click_on "Back"
  end

  test "destroying a Shop item image" do
    visit shop_item_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shop item image was successfully destroyed"
  end
end
