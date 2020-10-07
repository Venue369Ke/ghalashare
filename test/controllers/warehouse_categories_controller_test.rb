require 'test_helper'

class WarehouseCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse_category = warehouse_categories(:one)
  end

  test "should get index" do
    get warehouse_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_category_url
    assert_response :success
  end

  test "should create warehouse_category" do
    assert_difference('WarehouseCategory.count') do
      post warehouse_categories_url, params: { warehouse_category: { category: @warehouse_category.category, category_description: @warehouse_category.category_description, warehouse_id: @warehouse_category.warehouse_id } }
    end

    assert_redirected_to warehouse_category_url(WarehouseCategory.last)
  end

  test "should show warehouse_category" do
    get warehouse_category_url(@warehouse_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_category_url(@warehouse_category)
    assert_response :success
  end

  test "should update warehouse_category" do
    patch warehouse_category_url(@warehouse_category), params: { warehouse_category: { category: @warehouse_category.category, category_description: @warehouse_category.category_description, warehouse_id: @warehouse_category.warehouse_id } }
    assert_redirected_to warehouse_category_url(@warehouse_category)
  end

  test "should destroy warehouse_category" do
    assert_difference('WarehouseCategory.count', -1) do
      delete warehouse_category_url(@warehouse_category)
    end

    assert_redirected_to warehouse_categories_url
  end
end
