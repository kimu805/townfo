class MembershipsController < ApplicationController
  before_action :set_group

  def index
    @users = @group.users
    @pending_memberships = @group.pending_memberships 
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end
end
