class AnalysesController < ApplicationController
  before_action :set_analysis, only: [:show, :update, :destroy]

  # GET /analyses
  def index
    @analyses = Analysis.all.page(params[:page])
    if @analyses.empty? && params[:page].present?
      render json: { error: 'Page not found.' }, status: :not_found
    else
      render json: { analyses: @analyses, meta: { current: @analyses.current_page, total: @analyses.total_pages } }
    end
  end

  # GET /analyses/1
  def show
    render json: @analysis
  end

  # POST /analyses
  def create
    @analysis = Analysis.new(analysis_params)

    if @analysis.save
      render json: @analysis, status: :created, location: @analysis
    else
      render json: @analysis.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /analyses/1
  def update
    if @analysis.update(analysis_params)
      render json: @analysis
    else
      render json: @analysis.errors, status: :unprocessable_entity
    end
  end

  # DELETE /analyses/1
  def destroy
    @analysis.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis
      @analysis = Analysis.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Record not found.'}, status: :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def analysis_params
      params.require(:analysis).permit(:maybe_false_positive, :analysis_date, :provide_api_reference, :page_id, :dw_best_pratice_id, :open_gov_principle_id, :page)
    end
end
