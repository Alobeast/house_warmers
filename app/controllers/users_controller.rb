class UsersController < ApplicationController
  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
