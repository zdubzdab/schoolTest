class WelcomeController < ApplicationController
  def index

    @tidings = Tiding.paginate(page: params[:page], per_page: 2).order("created_at DESC")

    if params[:search]
      @tidings = Tiding.search(params[:search]).paginate(page: params[:page], per_page: 2).order("created_at DESC")

      respond_to do |format|
        format.js
      end
    end
  end
end
