# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def admin?
    logged_in? and current_user.role == 'admin'
  end
end
