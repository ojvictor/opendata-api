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
      post dw_best_pratices_url, params: { dw_best_pratice: { cite_original_publication: @dw_best_pratice.cite_original_publication, open_gov_principle_id: @dw_best_pratice.open_gov_principle_id, page_id: @dw_best_pratice.page_id, provide_bulk_download: @dw_best_pratice.provide_bulk_download, provide_data_license_info: @dw_best_pratice.provide_data_license_info, provide_data_provenance_info: @dw_best_pratice.provide_data_provenance_info, provide_data_up_to_date: @dw_best_pratice.provide_data_up_to_date, provide_descriptive_metadata: @dw_best_pratice.provide_descriptive_metadata, provide_feedback_info: @dw_best_pratice.provide_feedback_info, provide_metadata: @dw_best_pratice.provide_metadata, provide_multiple_formats_data: @dw_best_pratice.provide_multiple_formats_data, provide_version_info: @dw_best_pratice.provide_version_info, use_machine_readable_standardized_formats: @dw_best_pratice.use_machine_readable_standardized_formats, use_persistent_uri_as_dataset_identifier: @dw_best_pratice.use_persistent_uri_as_dataset_identifier } }, as: :json
    end

    assert_response 201
  end

  test "should show dw_best_pratice" do
    get dw_best_pratice_url(@dw_best_pratice), as: :json
    assert_response :success
  end

  test "should update dw_best_pratice" do
    patch dw_best_pratice_url(@dw_best_pratice), params: { dw_best_pratice: { cite_original_publication: @dw_best_pratice.cite_original_publication, open_gov_principle_id: @dw_best_pratice.open_gov_principle_id, page_id: @dw_best_pratice.page_id, provide_bulk_download: @dw_best_pratice.provide_bulk_download, provide_data_license_info: @dw_best_pratice.provide_data_license_info, provide_data_provenance_info: @dw_best_pratice.provide_data_provenance_info, provide_data_up_to_date: @dw_best_pratice.provide_data_up_to_date, provide_descriptive_metadata: @dw_best_pratice.provide_descriptive_metadata, provide_feedback_info: @dw_best_pratice.provide_feedback_info, provide_metadata: @dw_best_pratice.provide_metadata, provide_multiple_formats_data: @dw_best_pratice.provide_multiple_formats_data, provide_version_info: @dw_best_pratice.provide_version_info, use_machine_readable_standardized_formats: @dw_best_pratice.use_machine_readable_standardized_formats, use_persistent_uri_as_dataset_identifier: @dw_best_pratice.use_persistent_uri_as_dataset_identifier } }, as: :json
    assert_response 200
  end

  test "should destroy dw_best_pratice" do
    assert_difference('DwBestPratice.count', -1) do
      delete dw_best_pratice_url(@dw_best_pratice), as: :json
    end

    assert_response 204
  end
end
