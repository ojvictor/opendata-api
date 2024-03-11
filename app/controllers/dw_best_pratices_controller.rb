class DwBestPraticesController < ApplicationController
  before_action :set_dw_best_pratice, only: [:show, :update, :destroy]

  # GET /dw_best_pratices
  def index
    @dw_best_pratices = DwBestPratice.all.page(params[:page])
    if @dw_best_pratices.empty? && params[:page].present?
      render json: { error: 'Page not found.' }, status: :not_found
    else
      render json: { dw_best_pratices: @dw_best_pratices, meta: {current: @dw_best_pratices.current_page, total: @dw_best_pratices.total_pages} }
    end
  end

  # GET /dw_best_pratices/1
  def show
    render json: @dw_best_pratice
  end

  # POST /dw_best_pratices
  def create
    @dw_best_pratice = DwBestPratice.new(dw_best_pratice_params)

    if @dw_best_pratice.save
      render json: @dw_best_pratice, status: :created, location: @dw_best_pratice
    else
      render json: @dw_best_pratice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dw_best_pratices/1
  def update
    if @dw_best_pratice.update(dw_best_pratice_params)
      render json: @dw_best_pratice
    else
      render json: @dw_best_pratice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dw_best_pratices/1
  def destroy
    @dw_best_pratice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dw_best_pratice
      @dw_best_pratice = DwBestPratice.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Record not found.'}, status: :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def dw_best_pratice_params
      params.require(:dw_best_pratice).permit(:provide_metadata, :provide_descriptive_metadata, :provide_data_license_info, :provide_data_provenance_info, :provide_version_info, :provide_feedback_info, :provide_bulk_download, :provide_data_up_to_date, :use_persistent_uri_as_dataset_identifier, :use_machine_readable_standardized_formats, :provide_multiple_formats_data, :cite_original_publication, :page, :page_id, :open_gov_principle_id)
    end
end
