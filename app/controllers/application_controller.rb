# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem

  def only_admin
    unless logged_in? and current_user.role == 'admin'
      redirect_to root_path
    end
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
