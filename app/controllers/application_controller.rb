class ApplicationController < ActionController::Base
      helper_method :current_user
      #helper_method:cr_user
      # rescue_from CanCan::AccessDenied do |exception|
      #   flash[:error] = "Access denied."
      #   redirect_to root_url
      # end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]

    end
    def require_user
      redirect_to '/login' unless current_user
    end
    def current_project
    @current_project=Project.find(params[:id])
  end

  end
