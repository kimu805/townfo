class PendingMembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, except: :new
  before_action :ensure_owner, only: [:approve, :reject]

  # 参加したいグループを一覧で表示するメソッド
  def new
    @q = Group.ransack(params[:q])
    @groups = @q.result(distinct: true)
  end

  # グループの管理者へ参加申請を送るメソッド。
  def create
    @pending_membership = @group.pending_memberships.new(user: current_user)
    if @pending_membership.save
      redirect_to root_path, notice: "「#{@group.name}」への参加申請が送信されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # グループの管理者が申請を承認するメソッド。
  def approve
    pending_membership = @group.pending_memberships.find(params[:id])
    membership = @group.memberships.new(user: pending_membership.user)
    if membership.save
      pending_membership.destroy
      redirect_to group_path(@group), notice: "「#{membership.user.nickname}」が承認されました。"
    end
  end

  # グループの管理者が申請を拒否するメソッド。
  def reject
    pending_membership = @group.pending_memberships.find(params[:id])
    pending_membership.destroy
    redirect_to group_path(@group), notice: "参加申請が拒否されました。"
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  # グループの管理者以外のアクセスを排除するメソッド。
  def ensure_owner
    set_group
    unless current_user.id == @group.owner_id
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end
end
