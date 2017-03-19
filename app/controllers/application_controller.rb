class ApplicationController < ActionController::Base
  before_action :set_locale
  
  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_subdomain || I18n.default_locale
  end
  
  def extract_locale_from_subdomain
      parsed_locale = request.subdomains.first
      I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
    end
  
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end
