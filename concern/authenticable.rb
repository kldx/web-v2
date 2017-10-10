module Authenticable
  extend ActiveSupport::Concern
  included do
    helper_method :require_admin, :store_location, :redirect_back_or_default, :get_redirect_back_or_default
  end

  private

    def require_admin
      unless current_user.try(:admin?)
        flash.notice = "Admin permissions required to access this page."
        redirect_to root_path
      end
    end

    def store_location
      session[:return_to] = request.original_url rescue nil
    end

    def redirect_back_or_default(default)
      redirect_to (session[:return_to] || default)
      session[:return_to] = nil
    end

    def get_redirect_back_or_default(default)
      redirect = session[:return_to] ? session[:return_to] : default
    end
end
