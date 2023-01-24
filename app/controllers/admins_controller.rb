class AdminsController < ApplicationController
  before_action :user_is_admin, only: %i[articles_for_validation]
  def articles_for_validation
    @articles_for_validation = policy_scope(Article).where(status: "ask to be published").includes(:user)
    authorize :admin
  end

  private

  def user_is_admin
    redirect_to dashboard_index_path, notice: "unauthorized action!" unless current_user.admin
  end
end
