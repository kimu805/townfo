class CircularsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :set_circular, only: [:show, :destroy, :read_create]
  before_action :ensure_owner, except: [:index, :show, :read_create]

  def index
    @years = Circular.pluck(Arel.sql("DISTINCT EXTRACT(YEAR FROM created_at)")).map(&:to_i).sort # 回覧板の投稿から、投稿された年度を取得して昇順に並べる。
    @selected_year = params[:year] || Time.current.year # 送られてきた年度を取得。なければ、今年の年度を取得。
    @circulars = @group.circulars.selected_year(@selected_year).recent # 年度に該当する回覧板を新しい順に取得。
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
    @read = current_user.reads.find_by(readable: @circular, complete: true) # 回覧板に対するユーザーの既読情報を取得。
    @users = @group.users.order("nickname")
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

  def set_circular
    @circular = @group.circulars.find(params[:id])
  end

  # グループの管理者以外からのアクセスを排除するメソッド
  def ensure_owner
    set_group
    unless current_user.id == @group.owner_id
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end

end
