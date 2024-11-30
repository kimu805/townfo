class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)
    @notice = Notice.find(params[:notice_id])
    if @comment.save
      CommentChannel.broadcast_to @notice, {comment: @comment, user: @comment.user}
    else
      redirect_to group_notice_path(group_id: @notice.group_id, id: @notice.id), alert: "このコメントは投稿できません"
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:text).merge(notice_id: params[:notice_id])
  end
end
