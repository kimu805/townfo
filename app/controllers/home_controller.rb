class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.groups.exists?
      redirect_to group_notices_path(current_user.groups)
    end
  end
end
