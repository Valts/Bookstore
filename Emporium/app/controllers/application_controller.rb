class ApplicationController < ActionController::Base
  before_filter :set_locale
  helper :all # include all helpers, all the time
  protect_from_forgery :only => [:create, :update, :destroy]
  private
  def initialize_cart
    if session[:cart_id] and Cart.exists?(session[:cart_id])
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def set_locale
    accept_lang = request.env['HTTP_ACCEPT_LANGUAGE']
    accept_lang = accept_lang.blank? ? nil : accept_lang[/[^,;]+/]

    locale = params[:locale] || session[:locale] || accept_lang ||
        DEFAULT_LOCALE
    begin
      I18n.locale = locale
      session[:locale] = locale
      rescue
          I18n.locale = DEFAULT_LOCALE
    end
  end

  protected
  def admin_required
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == 'admin'
    end if RAILS_ENV == 'production' || params[:admin_http]
  end
end
