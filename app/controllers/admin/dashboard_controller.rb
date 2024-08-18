class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  layout 'admin' 
  
  def index
    @total_users = User.count
  end

  private

  def admin_only
    redirect_to root_path unless current_user.admin?
  end
end
