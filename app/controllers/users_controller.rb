class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Signup successful"
      redirect_to sessions_new_path
    else
      flash[:danger] = "Error"
      return 'new'
    end
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
