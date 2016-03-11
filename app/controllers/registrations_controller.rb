class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if params[:user_role]
      @user.add_role params[:user_role]
    end
  end

end
