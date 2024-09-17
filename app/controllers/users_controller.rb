class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_group.users.find(params[:id])
    @notices = @user.notices
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to group_user_path(group_id: current_group.id, id: current_user.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
  
end
