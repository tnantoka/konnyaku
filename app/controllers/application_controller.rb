class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

private

  def default_url_options
    if params[:l].present?
      return { :l => params[:l] }
    else
      return { :l => nil }
    end
  end

  def set_locale
    if params[:l].present?
      locale = params[:l]
    else
      locale = parse_accept_lang
    end

    if Lang.exists?(:code => locale)
      I18n.locale = locale
    else
      I18n.locale = I18n.default_locale
    end  
  end

  def parse_accept_lang 
    lang = request.env['HTTP_ACCEPT_LANGUAGE']
    return '' if lang.blank? 
    lang.scan(/^[a-z]{2}/).first
  end

  def current_user
    session[:username]
  end
  helper_method :current_user

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def sign_in_required
    unless user_signed_in?
      redirect_to :root, alert: I18n.t('flash.sessions.unauthenticated')
    end    
  end


end
