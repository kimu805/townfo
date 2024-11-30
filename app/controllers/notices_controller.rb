class NoticesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_notice, only: [:edit, :update, :destroy, :show, :mark_as_read]
  before_action :only_posted_person, only: [:edit, :update, :destroy]

  def index
    @q = current_group.notices.includes(:user).ransack(params[:q])
    # カレンダーからの日付指定がある場合は、日付に該当する投稿を表示。
    # 日付指定がない場合は、検索結果に該当するすべての投稿を表示。
    if params[:schedule].present?
      @notices = current_group.notices.where(schedule: params[:schedule]).includes(:user).recent
    else
      @notices = @q.result.recent
    end
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

  # 非同期で投稿に既読を付けるメソッド
  def mark_as_read
    current_user.reads.find_or_create_by(readable: @notice, complete: true)
    read_count = @notice.reads.count
    render json: {read_count: read_count}
  end

  # 投稿の内容に対して、AIによる文章自動生成を行うメソッド
  def generate_content
    chat_gpt = ChatGptService.new
    generated_text = chat_gpt.chat(params[:prompt])
    render json: { generated_text: generated_text }
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :content, :schedule, :tag_id, {images: []}).merge(user_id: current_user.id)
  end
  
  def set_notice
    @notice = current_group.notices.find(params[:id])
  end

  # 投稿した本人以外のアクセスを排除するメソッド
  def only_posted_person
    set_notice
    unless current_user == @notice.user
      redirect_to group_notice_path(group_id: @notice.group_id, id: @notice.id), alert: "投稿者本人しかアクセスできません"
    end
  end
end
