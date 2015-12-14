class WelcomeController < ApplicationController
  def index
    @tidings = Tiding.paginate(page: params[:page], per_page: 5).order("created_at DESC")
    @post = Tiding.where(main: true).last
    if params[:search]
      @tidings = Tiding.search(params[:search]).paginate(page: params[:page], per_page: 2).order("created_at DESC")

      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
