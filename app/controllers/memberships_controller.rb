class MembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :ensure_owner

  def index
    @users = @group.users
    @pending_memberships = @group.pending_memberships 
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def ensure_owner
    set_group
    unless current_user.id == @group.owner_id
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end
end
