require "application_system_test_case"

class SectorExperiencesTest < ApplicationSystemTestCase
  setup do
    @sector_experience = sector_experiences(:one)
  end

  test "visiting the index" do
    visit sector_experiences_url
    assert_selector "h1", text: "Sector Experiences"
  end

  test "creating a Sector experience" do
    visit sector_experiences_url
    click_on "New Sector Experience"

    fill_in "Experience item", with: @sector_experience.experience_item
    fill_in "Warehouse", with: @sector_experience.warehouse_id
    click_on "Create Sector experience"

    assert_text "Sector experience was successfully created"
    click_on "Back"
  end

  test "updating a Sector experience" do
    visit sector_experiences_url
    click_on "Edit", match: :first

    fill_in "Experience item", with: @sector_experience.experience_item
    fill_in "Warehouse", with: @sector_experience.warehouse_id
    click_on "Update Sector experience"

    assert_text "Sector experience was successfully updated"
    click_on "Back"
  end

  test "destroying a Sector experience" do
    visit sector_experiences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sector experience was successfully destroyed"
  end
end
