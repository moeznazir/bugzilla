class UsersController < ApplicationController
  def new
    log_out
    @user = User.new
  end
  def create 
    @user = User.new(user_params)
    if @user.save
      login_user @user
      flash[:success] = "Welcome to the Bugzilla!"
      redirect_to @user 
    else
      render :new
    end
  end
  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :user_role)
    end
end
