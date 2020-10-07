require "application_system_test_case"

class WarehouseCategoriesTest < ApplicationSystemTestCase
  setup do
    @warehouse_category = warehouse_categories(:one)
  end

  test "visiting the index" do
    visit warehouse_categories_url
    assert_selector "h1", text: "Warehouse Categories"
  end

  test "creating a Warehouse category" do
    visit warehouse_categories_url
    click_on "New Warehouse Category"

    fill_in "Category", with: @warehouse_category.category
    fill_in "Category description", with: @warehouse_category.category_description
    fill_in "Warehouse", with: @warehouse_category.warehouse_id
    click_on "Create Warehouse category"

    assert_text "Warehouse category was successfully created"
    click_on "Back"
  end

  test "updating a Warehouse category" do
    visit warehouse_categories_url
    click_on "Edit", match: :first

    fill_in "Category", with: @warehouse_category.category
    fill_in "Category description", with: @warehouse_category.category_description
    fill_in "Warehouse", with: @warehouse_category.warehouse_id
    click_on "Update Warehouse category"

    assert_text "Warehouse category was successfully updated"
    click_on "Back"
  end

  test "destroying a Warehouse category" do
    visit warehouse_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warehouse category was successfully destroyed"
  end
end
