class RegistrationsController < Devise::RegistrationsController

  def new
    super
    @user = User.new
    @user.build_image
    # @user.images.build
  end

  def create
    super
    if params[:user_role]
      @user.add_role params[:user_role]
    end
  end

end
