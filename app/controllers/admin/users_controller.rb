class Admin::UsersController < AdminController
  load_and_authorize_resource

  def index
    @teachers = User.teachers.order("created_at DESC").page(params[:page]).per(User::ADMIN_USERS_INDEX_PAGES)
    respond_to do |format|
      format.html { render partial: "users" if request.xhr? }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.destroy
        format.js { render nothing: true }
      else
        format.html { redirect_to admin_users_path, notice: t('.controllers.error') }
      end
    end
  end

    private

    def user_params
      params.require(:user).permit(:id, :full_name, :email, :avatar, :remove_avatar, :avatar_cache)
    end
end
