class SitesController < ApplicationController
  before_action :set_site, only: [:update, :destroy]

  # GET /sites
  def index
    @sites = Site.all.page(params[:page])
    if @sites.empty? && params[:page].present?
      render json: { error: 'Page not found.' }, status: :not_found
    else
      render json: { sites: @sites.as_json(methods: [:pages_count]), meta: { current: @sites.current_page, total: @sites.total_pages } }
    end
  end

  # GET /sites/1
  def show
    @site = Site.includes(:pages).find(params[:id])
    @pages = @site.pages.page(params[:page]) 

    if @pages.empty? && params[:page].present?
      render json: { error: 'Page not found.' }, status: :not_found
    else
      render json: { site: @site, pages: @pages, meta: { current: @pages.current_page, total: @pages.total_pages } } 
    end
  rescue ActiveRecord::RecordNotFound
      render json: { error: 'Record not found.'}, status: :not_found
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

    if @sites.empty? && params[:page].present?
      render json: { error: 'Page not found.' }, status: :not_found
    elsif @sites.empty?
        render json: { error: 'Record not found.' }, status: :not_found
    else
      render json: { sites: @sites, meta: { current: @sites.current_page, total: @sites.total_pages } }
    end
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
