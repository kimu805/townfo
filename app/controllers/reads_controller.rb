class ReadsController < ApplicationController
  before_action :set_obj
  
  def create
    ActiveRecord::Base.transaction do
      current_user.reads.find_or_create_by(readable: @obj, complete: true)
    end
    read_count = @obj.reads.count
    respond_to do |format|
      format.html { redirect_to group_circular_path(group_id: current_group.id, id: @obj.id) }
      format.json { render json: {read_count: read_count} }
    end
  end

  private
  
  def set_obj
    @obj = if params[:notice_id]
      Notice.find(params[:notice_id])
    elsif params[:circular_id]
      Circular.find(params[:circular_id])
    end
  end
end
