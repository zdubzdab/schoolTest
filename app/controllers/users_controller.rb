class UsersController < ApplicationController

  def index
    @teachers = User.teachers.order("created_at DESC").page(params[:page]).per(User::USERS_INDEX_PAGES)
    respond_to do |format|
      format.html { render partial: "users" if request.xhr? }
    end
  end

    private

    def user_params
      params.require(:user).permit(:id, :full_name, :description, :avatar)
    end
end
