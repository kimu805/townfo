class CircularsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :set_circular, only: [:show, :destroy]
  before_action :ensure_owner, except: [:index, :show]

  def index
    @circulars = @group.circulars
  end

  def new
    @circular = @group.circulars.build()
  end

  def create
    @circular = @group.circulars.build(circular_params)
    if @circular.save
      redirect_to group_circulars_path(current_group) , notice: "回覧板を投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @circular.destroy
    redirect_to group_circulars_path(current_group), notice: "「#{@circular.title}」を削除しました。"
  end

  private
  def circular_params
    params.require(:circular).permit(:title, :pdf_file).merge(group_id: @group.id, user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def ensure_owner
    set_group
    unless current_user.id == @group.owner_id
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end

  def set_circular
    @circular = @group.circulars.find(params[:id])
  end
end
