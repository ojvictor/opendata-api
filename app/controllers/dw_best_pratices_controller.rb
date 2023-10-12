class DwBestPraticesController < ApplicationController
  before_action :set_dw_best_pratice, only: [:show, :update, :destroy]

  # GET /dw_best_pratices
  def index
    @dw_best_pratices = DwBestPratice.all

    render json: @dw_best_pratices
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
    end

    # Only allow a trusted parameter "white list" through.
    def dw_best_pratice_params
      params.require(:dw_best_pratice).permit(:metadata, :version, :license, :page_id, :open_gov_principle_id)
    end
end
