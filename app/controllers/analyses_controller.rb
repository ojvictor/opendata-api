class AnalysesController < ApplicationController
  before_action :set_analysis, only: [:show, :update, :destroy]

  # GET /analyses
  def index
    @analyses = Analysis.all

    render json: @analyses
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
    end

    # Only allow a trusted parameter "white list" through.
    def analysis_params
      params.require(:analysis).permit(:false_positive, :analysis_date, :page_id, :dw_best_pratice_id, :open_gov_principle_id)
    end
end
