class Admin::StudentsController < ApplicationController

  def index
    @students = User.students.order("created_at DESC").page(params[:page]).per(User::ADMIN_STUDENTS_INDEX_PAGES)
      respond_to do |format|
        format.html { render partial: "students" if request.xhr? }
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_students_path
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
        format.html { redirect_to admin_students_path, notice: t('.controllers.error') }
      end
    end
  end

    private

    def user_params
      params.require(:user).permit(:id, :full_name, :email, :categgory_id)
    end
end
