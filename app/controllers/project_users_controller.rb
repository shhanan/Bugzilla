class ProjectUsersController < ApplicationController
  load_and_authorize_resource
  def new
    @project_user=ProjectUser.new
  end
  def create
    #@project_id=Project.find(params[:id])
    @project_user=ProjectUser.new(project_user_params)
    byebug
    if @project_user.save
      redirect_to projects_path
    end
  end

  private
  def project_user_params
    params.require(:project_user).permit(:user_id, :project_id)
  end
end
