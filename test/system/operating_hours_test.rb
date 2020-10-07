require "application_system_test_case"

class OperatingHoursTest < ApplicationSystemTestCase
  setup do
    @operating_hour = operating_hours(:one)
  end

  test "visiting the index" do
    visit operating_hours_url
    assert_selector "h1", text: "Operating Hours"
  end

  test "creating a Operating hour" do
    visit operating_hours_url
    click_on "New Operating Hour"

    fill_in "Friday from", with: @operating_hour.friday_from
    fill_in "Friday to", with: @operating_hour.friday_to
    fill_in "Monday from", with: @operating_hour.monday_from
    fill_in "Monday to", with: @operating_hour.monday_to
    fill_in "Sat from", with: @operating_hour.sat_from
    fill_in "Sat to", with: @operating_hour.sat_to
    fill_in "Sunday from", with: @operating_hour.sunday_from
    fill_in "Sunday to", with: @operating_hour.sunday_to
    fill_in "Thursday from", with: @operating_hour.thursday_from
    fill_in "Thursday to", with: @operating_hour.thursday_to
    fill_in "Tuesday from", with: @operating_hour.tuesday_from
    fill_in "Tuesday to", with: @operating_hour.tuesday_to
    fill_in "Warehouse", with: @operating_hour.warehouse_id
    fill_in "Wednesday from", with: @operating_hour.wednesday_from
    fill_in "Wednesday to", with: @operating_hour.wednesday_to
    click_on "Create Operating hour"

    assert_text "Operating hour was successfully created"
    click_on "Back"
  end

  test "updating a Operating hour" do
    visit operating_hours_url
    click_on "Edit", match: :first

    fill_in "Friday from", with: @operating_hour.friday_from
    fill_in "Friday to", with: @operating_hour.friday_to
    fill_in "Monday from", with: @operating_hour.monday_from
    fill_in "Monday to", with: @operating_hour.monday_to
    fill_in "Sat from", with: @operating_hour.sat_from
    fill_in "Sat to", with: @operating_hour.sat_to
    fill_in "Sunday from", with: @operating_hour.sunday_from
    fill_in "Sunday to", with: @operating_hour.sunday_to
    fill_in "Thursday from", with: @operating_hour.thursday_from
    fill_in "Thursday to", with: @operating_hour.thursday_to
    fill_in "Tuesday from", with: @operating_hour.tuesday_from
    fill_in "Tuesday to", with: @operating_hour.tuesday_to
    fill_in "Warehouse", with: @operating_hour.warehouse_id
    fill_in "Wednesday from", with: @operating_hour.wednesday_from
    fill_in "Wednesday to", with: @operating_hour.wednesday_to
    click_on "Update Operating hour"

    assert_text "Operating hour was successfully updated"
    click_on "Back"
  end

  test "destroying a Operating hour" do
    visit operating_hours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Operating hour was successfully destroyed"
  end
end
