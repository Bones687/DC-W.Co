class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize
    if session[:user_id]
    	@current_user = User.find_by_id(session[:user_id])
    	if !@current_user.admin
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end
  private
    def categories_list
      @categories ||= Category.all
    end

    helper_method :categories_list

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    helper_method :current_user
end
