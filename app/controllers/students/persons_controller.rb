class Students::PersonsController < ApplicationController

  def profile
    @categgories_with_subjects = current_user.categgories_with_subjects
    @subject = current_user.subject
  end

  private
    def user_params
      params.require(:user).permit(:full_name, :email)
    end
end
