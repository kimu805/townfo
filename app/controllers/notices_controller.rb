class NoticesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_notice, only: [:edit, :update, :destroy, :show, :mark_as_read]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @notices = current_group.notices.includes(:user)
  end

  def new
    @notice = current_group.notices.build
  end

  def create
    @notice = current_group.notices.build(notice_params)
    if @notice.save
      redirect_to group_notices_path(current_group), notice: "投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @notice.update(notice_params)
      redirect_to group_notices_path(current_group), notice: "編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @notice.destroy
    redirect_to group_notices_path(current_group), notice: "削除しました。"
  end

  def show
    @comment = current_user.comments.build
    @comments = @notice.comments.includes(:user)
  end

  def mark_as_read
    current_user.reads.find_or_create_by(readable: @notice, complete: true)
    read_count = @notice.reads.count
    render json: {read_count: read_count}
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :content, :schedule, :tag_id, {images: []}).merge(user_id: current_user.id)
  end
  
  def set_notice
    @notice = current_group.notices.find(params[:id])
  end

  def move_to_index
    set_notice
    unless current_user == @notice.user
      redirect_to action: :index
    end
  end
end
