require 'test_helper'

class WarehousetypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehousetype = warehousetypes(:one)
  end

  test "should get index" do
    get warehousetypes_url
    assert_response :success
  end

  test "should get new" do
    get new_warehousetype_url
    assert_response :success
  end

  test "should create warehousetype" do
    assert_difference('Warehousetype.count') do
      post warehousetypes_url, params: { warehousetype: { type_item: @warehousetype.type_item, warehouse_id: @warehousetype.warehouse_id } }
    end

    assert_redirected_to warehousetype_url(Warehousetype.last)
  end

  test "should show warehousetype" do
    get warehousetype_url(@warehousetype)
    assert_response :success
  end

  test "should get edit" do
    get edit_warehousetype_url(@warehousetype)
    assert_response :success
  end

  test "should update warehousetype" do
    patch warehousetype_url(@warehousetype), params: { warehousetype: { type_item: @warehousetype.type_item, warehouse_id: @warehousetype.warehouse_id } }
    assert_redirected_to warehousetype_url(@warehousetype)
  end

  test "should destroy warehousetype" do
    assert_difference('Warehousetype.count', -1) do
      delete warehousetype_url(@warehousetype)
    end

    assert_redirected_to warehousetypes_url
  end
end
