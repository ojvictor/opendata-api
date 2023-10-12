require 'test_helper'

class DwBestPraticesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dw_best_pratice = dw_best_pratices(:one)
  end

  test "should get index" do
    get dw_best_pratices_url, as: :json
    assert_response :success
  end

  test "should create dw_best_pratice" do
    assert_difference('DwBestPratice.count') do
      post dw_best_pratices_url, params: { dw_best_pratice: { license: @dw_best_pratice.license, metadata: @dw_best_pratice.metadata, open_gov_principle_id: @dw_best_pratice.open_gov_principle_id, page_id: @dw_best_pratice.page_id, version: @dw_best_pratice.version } }, as: :json
    end

    assert_response 201
  end

  test "should show dw_best_pratice" do
    get dw_best_pratice_url(@dw_best_pratice), as: :json
    assert_response :success
  end

  test "should update dw_best_pratice" do
    patch dw_best_pratice_url(@dw_best_pratice), params: { dw_best_pratice: { license: @dw_best_pratice.license, metadata: @dw_best_pratice.metadata, open_gov_principle_id: @dw_best_pratice.open_gov_principle_id, page_id: @dw_best_pratice.page_id, version: @dw_best_pratice.version } }, as: :json
    assert_response 200
  end

  test "should destroy dw_best_pratice" do
    assert_difference('DwBestPratice.count', -1) do
      delete dw_best_pratice_url(@dw_best_pratice), as: :json
    end

    assert_response 204
  end
end
