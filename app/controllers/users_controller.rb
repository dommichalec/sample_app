class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App, #{@user.first_name}!"
      render :show
    else
      render :new
    end
  end

  private

  def user_params
    # use strong params below:
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
