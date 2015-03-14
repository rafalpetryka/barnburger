class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale


  private
  	def set_locale
  		I18n.locale = params[:locale] if params[:locale].present?
  		# current_user.locale
  		# request.subdomain
  		# request.env["HTTP_ACCEPT_LANGUAGE"]
  		# request.remote_ip
  	end
end
