class WelcomeController < ApplicationController

  def index
    @post = Tiding.where(main: true).last
    @tidings = Tiding.order("created_at DESC").page(params[:page]).per(Tiding::WELCOME_INDEX_PAGES)
    respond_to do |format|
      format.html { render partial: "tidings" if request.xhr? }
    end
  end

  def search
    if params[:search]
      @tidings = Tiding.search(params[:search]).order("created_at DESC").page(params[:page]).per(Tiding::WELCOME_INDEX_PAGES)
    else
      @tidings = Tiding.order("created_at DESC").page(params[:page]).per(Tiding::WELCOME_INDEX_PAGES)
    end
    respond_to do |format|
      format.html { render partial: "tidings" if request.xhr? }
    end
  end

  def show
    @tiding = Tiding.find(params[:id])
  end

end


