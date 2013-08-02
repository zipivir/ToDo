class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :check_access

  protect_from_forgery with: :exception

  private
  def check_access
    redirect_to login_index_path unless session[:user]
  end
  
end
