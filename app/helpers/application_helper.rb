module ApplicationHelper
	def logged_in?
		!!session[:user_id]
	end

	def current_user
      @current_user ||=User.find_by_id(session[:id]) if !!session[:user_id]
	end
	def current_project
		@current_project= Project.all

	end
end
