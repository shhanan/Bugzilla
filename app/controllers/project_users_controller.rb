class ProjectUsersController < ApplicationController
  load_and_authorize_resource

  def new
    @project_user=ProjectUser.new
    @project_id = params[:project_id]
  end
  def show

  end
  def create

    @project_user=ProjectUser.new(project_user_params)
    if @project_user.save
      redirect_to projects_path
    end
  end

  def destroy
    byebug
    @project_id = params[:project_id]
    @user_id = params[:user_id]
    @project_user=ProjectUser.where(project_id:@project_id,user_id:@user_id).pluck(:id)

  end

  private
  def project_user_params
    params.require(:project_user).permit(:user_id, :project_id)
  end
end
