class SitesController < ApplicationController
  before_action :set_site, only: [:update, :destroy]

  # GET /sites
  def index
    @sites = Site.all.page(params[:page])

    # render json: { sites: @sites.as_json(include: { pages: { only: %i[id title url] } }, methods: [:pages_count]), meta: {current: @sites.current_page, total: @sites.total_pages} }
    render json: { sites: @sites.as_json(methods: [:pages_count]), meta: {current: @sites.current_page, total: @sites.total_pages} }
  end

  # GET /sites/1
  def show

    @site = Site.includes(:pages).find(params[:id])
    @pages = @site.pages.page(params[:page]) 
    # render json: @site.as_json(include: { pages: { only: %i[id title url] } }, methods: [:pages_count])
    # render json: @site, include: { pages: { only: %i[id title url] } }, methods: [:pages_count], meta: { current: @pages.current_page, total: @pages.total_pages }
    render json: { site: @site, pages: @pages, meta: { current: @pages.current_page, total: @pages.total_pages } } 
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
