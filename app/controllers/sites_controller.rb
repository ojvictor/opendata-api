class SitesController < ApplicationController
  before_action :set_site, only: [:show, :update, :destroy]

  # GET /sites
  def index
    @sites = Site.all.page(params[:page])

    paginate json: @sites.as_json(include: { pages: { only: %i[id title url] } }, methods: [:pages_count])
  end

  # GET /sites/1
  def show
    render json: @site.as_json(include: { pages: { only: %i[id title url] } }, methods: [:pages_count])
  end

  # POST /sites
  def create
    @site = Site.new(site_params)

    if @site.save
      render json: @site, status: :created, location: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @site.update(site_params)
      render json: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sites/1
  def destroy
    @site.destroy
  end

  # SEARCH /sites/search?q=
  def search
    @sites = Site.search_by_domain(params[:q]).page(params[:page])
    render json: { sites: @sites, meta: { total: @sites.total_pages, current: @sites.current_page } }
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def site_params
      params.require(:site).permit(:domain, :title, :page, :description)
    end
end
