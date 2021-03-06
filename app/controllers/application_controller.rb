class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # Authenticate user for the login
  before_action :authenticate_user!
  protect_from_forgery with: :exception
end
