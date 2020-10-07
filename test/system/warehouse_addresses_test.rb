require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
  end

  test "visiting the index" do
    visit addresses_url
    assert_selector "h1", text: "Warehouse Addresses"
  end

  test "creating a Warehouse address" do
    visit addresses_url
    click_on "New Warehouse Address"

    fill_in "Address1", with: @address.address1
    fill_in "Address2", with: @address.address2
    fill_in "City", with: @address.city
    fill_in "Country", with: @address.country
    fill_in "Postal code", with: @address.postal_code
    fill_in "Warehouse", with: @address.warehouse_id
    click_on "Create Warehouse address"

    assert_text "Warehouse address was successfully created"
    click_on "Back"
  end

  test "updating a Warehouse address" do
    visit addresses_url
    click_on "Edit", match: :first

    fill_in "Address1", with: @address.address1
    fill_in "Address2", with: @address.address2
    fill_in "City", with: @address.city
    fill_in "Country", with: @address.country
    fill_in "Postal code", with: @address.postal_code
    fill_in "Warehouse", with: @address.warehouse_id
    click_on "Update Warehouse address"

    assert_text "Warehouse address was successfully updated"
    click_on "Back"
  end

  test "destroying a Warehouse address" do
    visit addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warehouse address was successfully destroyed"
  end
end
