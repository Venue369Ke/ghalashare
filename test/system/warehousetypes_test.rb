require "application_system_test_case"

class WarehousetypesTest < ApplicationSystemTestCase
  setup do
    @warehousetype = warehousetypes(:one)
  end

  test "visiting the index" do
    visit warehousetypes_url
    assert_selector "h1", text: "Warehousetypes"
  end

  test "creating a Warehousetype" do
    visit warehousetypes_url
    click_on "New Warehousetype"

    fill_in "Type item", with: @warehousetype.type_item
    fill_in "Warehouse", with: @warehousetype.warehouse_id
    click_on "Create Warehousetype"

    assert_text "Warehousetype was successfully created"
    click_on "Back"
  end

  test "updating a Warehousetype" do
    visit warehousetypes_url
    click_on "Edit", match: :first

    fill_in "Type item", with: @warehousetype.type_item
    fill_in "Warehouse", with: @warehousetype.warehouse_id
    click_on "Update Warehousetype"

    assert_text "Warehousetype was successfully updated"
    click_on "Back"
  end

  test "destroying a Warehousetype" do
    visit warehousetypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warehousetype was successfully destroyed"
  end
end
