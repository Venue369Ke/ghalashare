require 'test_helper'

class SectorExperiencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sector_experience = sector_experiences(:one)
  end

  test "should get index" do
    get sector_experiences_url
    assert_response :success
  end

  test "should get new" do
    get new_sector_experience_url
    assert_response :success
  end

  test "should create sector_experience" do
    assert_difference('SectorExperience.count') do
      post sector_experiences_url, params: { sector_experience: { experience_item: @sector_experience.experience_item, warehouse_id: @sector_experience.warehouse_id } }
    end

    assert_redirected_to sector_experience_url(SectorExperience.last)
  end

  test "should show sector_experience" do
    get sector_experience_url(@sector_experience)
    assert_response :success
  end

  test "should get edit" do
    get edit_sector_experience_url(@sector_experience)
    assert_response :success
  end

  test "should update sector_experience" do
    patch sector_experience_url(@sector_experience), params: { sector_experience: { experience_item: @sector_experience.experience_item, warehouse_id: @sector_experience.warehouse_id } }
    assert_redirected_to sector_experience_url(@sector_experience)
  end

  test "should destroy sector_experience" do
    assert_difference('SectorExperience.count', -1) do
      delete sector_experience_url(@sector_experience)
    end

    assert_redirected_to sector_experiences_url
  end
end
