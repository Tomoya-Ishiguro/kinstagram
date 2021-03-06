class UsersController < ApplicationController
  before_action :authenticate_user!
  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice: "ユーザー情報を更新しました。"
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
