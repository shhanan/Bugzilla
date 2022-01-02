class SessionsController < ApplicationController
    before_action :require_user, only: [:index, :show]
    def create
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id

      flash[:notice] = "Logged in successfully."
      redirect_to '/dashboard'
      else
      flash[:danger] = "There was something wrong with your login details."
      render 'new'
      end
    end
 
    def destroy
      session.delete :user_id
      redirect_to root_path,notice: "Logged out"

    def create_project
        @user = User.find_by_email(session[:email])
        # render plain: @user.inspect
        end


      #redirect_to root_path
    end
    end

