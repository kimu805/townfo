class MembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :ensure_owner_or_myself

  def destroy
    membership_user = Membership.find(params[:id])
    membership_user.destroy
    if current_group
      redirect_to group_path(@group), notice: "「#{membership_user.user.nickname}」様を退会させました。"
    else
      redirect_to root_path
    end
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def ensure_owner_or_myself
    set_group
    unless current_user.id == @group.owner_id || Membership.find(params[:id]).user == current_user
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end
end
