# frozen_string_literal: true

class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
	  if current_user.is_admin?
      admin_dashboard_path
    else
      company_path(current_user.company)
    end
#     stored_location_for(resource) || welcome_path
  end
end
