class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # パスワードなしで更新できるメソッド
  def update_resource(resource, params)
    logger.info("Updating resource without password for #{resource.email}")
    resource.update_without_password(params)
  end

  # 編集後のリダイレクト先を指定するメソッド
  def after_update_path_for(resource)
    logger.info("Redirecting to after update path for user: #{resource.id}")
    group_user_path(group_id: resource.groups.first.id, id: resource.id)
  end

  # 更新処理をカスタマイズしてフォーマットを明示的に指定
  def update
    logger.info("Starting update action")
    super do |resource|
      if resource.errors.any?
        logger.error("Update failed with errors: #{resource.errors.full_messages}")
      else
        logger.info("Successfully updated resource: #{resource.id}")
      end
      
      respond_to do |format|
        format.html { redirect_to after_update_path_for(resource) }
        format.json { render json: resource, status: :ok }
      end
    end
  rescue StandardError => e
    logger.error("An error occurred during update: #{e.message}")
    raise
  end
end
