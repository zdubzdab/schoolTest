class Students::PersonsController < ApplicationController

  def profile
    @subjects = current_user.subjects
  end

  private
    def user_params
      params.require(:user).permit(:full_name, :email)
    end
end
