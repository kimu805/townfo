class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
