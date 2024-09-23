class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      ActionCable.server.broadcast "comment_channel", {comment: @comment, user: @comment.user}
    else
      render "notice/show"
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:text).merge(notice_id: params[:notice_id])
  end
end
