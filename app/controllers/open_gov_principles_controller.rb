class OpenGovPrinciplesController < ApplicationController
  before_action :set_open_gov_principle, only: [:show, :update, :destroy]

  # GET /open_gov_principles
  def index
    @open_gov_principles = OpenGovPrinciple.all.page(params[:page])

    paginate json: @open_gov_principles
  end

  # GET /open_gov_principles/1
  def show
    render json: @open_gov_principle
  end

  # POST /open_gov_principles
  def create
    @open_gov_principle = OpenGovPrinciple.new(open_gov_principle_params)

    if @open_gov_principle.save
      render json: @open_gov_principle, status: :created, location: @open_gov_principle
    else
      render json: @open_gov_principle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /open_gov_principles/1
  def update
    if @open_gov_principle.update(open_gov_principle_params)
      render json: @open_gov_principle
    else
      render json: @open_gov_principle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /open_gov_principles/1
  def destroy
    @open_gov_principle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_open_gov_principle
      @open_gov_principle = OpenGovPrinciple.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def open_gov_principle_params
      params.require(:open_gov_principle).permit(:completeness, :primacy, :timeliness, :easy_phisical_or_eletronic_access, :machine_readability, :non_discrimination, :commonly_owned_or_open_standards, :licensing, :permanence, :usage_costs, :site_id)
    end
end
