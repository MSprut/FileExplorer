require 'test_helper'

class AssetFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asset_file = asset_files(:one)
  end

  test "should get index" do
    get asset_files_url
    assert_response :success
  end

  test "should get new" do
    get new_asset_file_url
    assert_response :success
  end

  test "should create asset_file" do
    assert_difference('AssetFile.count') do
      post asset_files_url, params: { asset_file: { user_id: @asset_file.user_id } }
    end

    assert_redirected_to asset_file_url(AssetFile.last)
  end

  test "should show asset_file" do
    get asset_file_url(@asset_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_asset_file_url(@asset_file)
    assert_response :success
  end

  test "should update asset_file" do
    patch asset_file_url(@asset_file), params: { asset_file: { user_id: @asset_file.user_id } }
    assert_redirected_to asset_file_url(@asset_file)
  end

  test "should destroy asset_file" do
    assert_difference('AssetFile.count', -1) do
      delete asset_file_url(@asset_file)
    end

    assert_redirected_to asset_files_url
  end
end
