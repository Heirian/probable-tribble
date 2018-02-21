class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :default_url_options

  private

  def set_locale
    I18n.locale = params[:locale] || current_user.try(:locale) || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
