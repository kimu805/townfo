class CircularsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :set_circular, only: [:show, :destroy, :read_create]
  before_action :ensure_owner, except: [:index, :show, :read_create]

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
    @read = current_user.reads.find_by(readable: @circular, complete: true)
    @users = @group.users
  end

  def destroy
    @circular.destroy
    redirect_to group_circulars_path(current_group), notice: "「#{@circular.title}」を削除しました。"
  end

  def read_create
    current_user.reads.find_or_create_by(readable: @circular, complete: true)
    redirect_to group_circular_path(group_id: current_group.id, id: @circular.id )
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
