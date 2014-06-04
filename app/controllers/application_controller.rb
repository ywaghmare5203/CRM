class ApplicationController < ActionController::Base
  protect_from_forgery

  # Make methods accessible in view
  helper_method :current_user, :current_user_session, :current_admin

  # Remove this line if the application is no longer in alpha phase.
  before_filter :restrict_alpha_access
  
  # Disable layout for AJAX request.
  layout proc {|c| c.request.xhr? ? false : 'application' }
  
protected  
  # Retrieve current user session.
  def current_user_session
    return @current_user_session if defined? @current_user_session
    @current_user_session = UserSession.find
  end

  # Retrieve current user.
  def current_user
    return @current_user if defined? @current_user
    @current_user = current_user_session && current_user_session.user
  end

  def current_admin
    @current_admin = Admin.find(session[:admin_id]) if session[:admin_id]
  end
  
  # Require user to be logged in.
  def require_login
    unless current_user.present?
      respond_to do |format|
        format.html { redirect_to new_user_session_url, alert: "You must be logged in to access this page" }
        format.any(:js, :xml, :json) { render nothing: true, status: :forbidden }
      end

      return false
    end
  end

  # Restrict access in alpha release. 
  # Access is limited to registered users.
  def restrict_alpha_access
    if (Rails.env.production? && current_user_session.nil?)
      redirect_to "/maintenance.html" 
    end
  end

  # Render the given error message.
  def render_error(message, options = {})
    default_options = { status: :forbidden }
    @error = message
    render 'shared/error', default_options.merge(options)
  end
end
