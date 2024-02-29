class PagesController < ApplicationController
  before_action :set_page, only: [:show, :update, :destroy]

  # GET /pages
  def index
    @pages = Page.all.page(params[:page])
    if @pages.empty? && params[:page].present?
      render json: { error: 'Page not found.' }, status: :not_found
    else
      render json: { pages: @pages, meta: { current: @pages.current_page, total: @pages.total_pages} }
    end
  end

  # GET /pages/1
  def show
    render json: @page
  end

  # POST /pages
  def create
    @page = Page.new(page_params)

    if @page.save
      render json: @page, status: :created, location: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      render json: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
  end

  # SEARCH
  def search
    @pages = Page.search_by_url(params[:q]).page(params[:page])

    if @pages.empty? && params[:page].present?
      render json: { error: 'Page not found.' }, status: :not_found
    elsif @pages.empty?
      render json: { error: 'Record not found.' }, status: :not_found
    else
      render json: { pages: @pages, meta: { total: @pages.total_pages, current: @pages.current_page } }
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Record not found.'}, status: :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:title, :url, :site_id, :page)
    end
end
