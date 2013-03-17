class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :set_search_form
  before_action :load_settings
  before_action :load_categories
  before_action :load_langs
  before_action :load_posts
  before_action :enable_sidebar

private

  def default_url_options
    if params[:l].present?
      return { l: params[:l] }
    else
      return { l: nil }
    end
  end

  def set_locale
    if params[:l].present?
      locale = params[:l]
    else
      locale = parse_accept_lang
    end

    if Lang.exists?(code: locale)
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

  def current_lang
    Lang.find_by(code: I18n.locale)
  end
  helper_method :current_lang

  def user_signed_in?
    current_user.present? && current_user == @settings.admin.username
  end
  helper_method :user_signed_in?

  def sign_in_required
    unless user_signed_in?
      redirect_to :root, alert: I18n.t('flash.sessions.unauthenticated')
    end    
  end

  def set_search_form
    @search_form = SearchForm.new(params[:search_form])
  end
    
  def load_settings
    @settings = Settings.try(current_lang.code) || Settings.get(Lang.primary.code)
  end

  def load_categories
    @categories = Category.all
  end

  def load_langs
    @langs = Lang.all
  end

  def load_posts
    @posts = Post.index(current_lang)
    @recent_posts = @posts.limit(@settings.post.pagination.recent)
  end

  def enable_sidebar 
    @has_sidebar = true
  end

  def with_locale(locale, &block)
    original_locale = I18n.locale
    I18n.locale = locale
    result = yield
    I18n.locale = original_locale
    return result
  end
  helper_method :with_locale
 
end
