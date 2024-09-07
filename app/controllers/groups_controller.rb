class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:edit, :update, :destroy, :show]
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to root_path, notice: "グループ「#{@group.name}」を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: "グループ「#{@group.name}」を編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
    redirect_to root_path, notice: "グループ「#{@group.name}」を削除しました。"
  end

  def show
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def ensure_owner
    set_group
    unless current_user.id == @group.owner_id
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end
end
