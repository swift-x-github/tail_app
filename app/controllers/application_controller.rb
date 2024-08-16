class ApplicationController < ActionController::Base
    # Override the path after sign in
  def after_sign_in_path_for(resource)
    admin_dashboard_index_path # or whatever path you want to redirect to
  end
end
