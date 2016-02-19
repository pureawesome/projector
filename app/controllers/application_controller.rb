class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  private
    def current_user
      # @current_user ||= User.find(session[:user_id]) if session[:user_id]
      # use current user or look up user (caching)
      warden.user
    end
    helper_method :current_user # takes a key and makes available in all views and controllers

    def authorize
      redirect_to sign_in_url, alert: 'You must be signed in to use this application.' if current_user.nil?
      #bounce back to sign in page
    end

    def warden
      env['warden']
    end
end
