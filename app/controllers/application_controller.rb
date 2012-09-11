class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  def current_user
    User.find_by_id(session[:user_id])
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in"
      end
    end
    
end
