class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def show
    @user = current_group.users.find(params[:id])
    @notices = @user.notices
  end

  def edit
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end
end
