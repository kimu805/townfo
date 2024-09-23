class CommentChannel < ApplicationCable::Channel
  def subscribed
    @notice = Notice.find(params[:notice_id])
    stream_for @notice
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
