require 'test_helper'

class OperatingHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operating_hour = operating_hours(:one)
  end

  test "should get index" do
    get operating_hours_url
    assert_response :success
  end

  test "should get new" do
    get new_operating_hour_url
    assert_response :success
  end

  test "should create operating_hour" do
    assert_difference('OperatingHour.count') do
      post operating_hours_url, params: { operating_hour: { friday_from: @operating_hour.friday_from, friday_to: @operating_hour.friday_to, monday_from: @operating_hour.monday_from, monday_to: @operating_hour.monday_to, sat_from: @operating_hour.sat_from, sat_to: @operating_hour.sat_to, sunday_from: @operating_hour.sunday_from, sunday_to: @operating_hour.sunday_to, thursday_from: @operating_hour.thursday_from, thursday_to: @operating_hour.thursday_to, tuesday_from: @operating_hour.tuesday_from, tuesday_to: @operating_hour.tuesday_to, warehouse_id: @operating_hour.warehouse_id, wednesday_from: @operating_hour.wednesday_from, wednesday_to: @operating_hour.wednesday_to } }
    end

    assert_redirected_to operating_hour_url(OperatingHour.last)
  end

  test "should show operating_hour" do
    get operating_hour_url(@operating_hour)
    assert_response :success
  end

  test "should get edit" do
    get edit_operating_hour_url(@operating_hour)
    assert_response :success
  end

  test "should update operating_hour" do
    patch operating_hour_url(@operating_hour), params: { operating_hour: { friday_from: @operating_hour.friday_from, friday_to: @operating_hour.friday_to, monday_from: @operating_hour.monday_from, monday_to: @operating_hour.monday_to, sat_from: @operating_hour.sat_from, sat_to: @operating_hour.sat_to, sunday_from: @operating_hour.sunday_from, sunday_to: @operating_hour.sunday_to, thursday_from: @operating_hour.thursday_from, thursday_to: @operating_hour.thursday_to, tuesday_from: @operating_hour.tuesday_from, tuesday_to: @operating_hour.tuesday_to, warehouse_id: @operating_hour.warehouse_id, wednesday_from: @operating_hour.wednesday_from, wednesday_to: @operating_hour.wednesday_to } }
    assert_redirected_to operating_hour_url(@operating_hour)
  end

  test "should destroy operating_hour" do
    assert_difference('OperatingHour.count', -1) do
      delete operating_hour_url(@operating_hour)
    end

    assert_redirected_to operating_hours_url
  end
end
