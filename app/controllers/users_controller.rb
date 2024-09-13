class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_group.users.find(params[:id])
    @notices = @user.notices
  end
end
