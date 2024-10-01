class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @notices = @user.notices.recent
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to group_user_path(group_id: current_group.id, id: current_user.id), notice: "「#{current_user.nickname}」様の情報を変更しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :profile)
  end
  
end
