class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    # @projects= Project.all
    @projects = Project.accessible_by(current_ability)
  end
  def show

    @project_id = Project.find(params[:id])
    @bugs=Bug.where(project_id: @project_id)
    @project_user=ProjectUser.where(project_id: @project_id)
     @user=User.all
  end
  def new
    @project = Project.new
  end
  def create
    @user=current_user.id
    @project = Project.new(project_params)
    if @project.save
      redirect_to '/projects'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @user = current_user.id
    @project = Project.find(params[:id])

  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to '/projects'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to '/projects'
  end
  private
  def project_params
    params.require(:project).permit(:title, :description, :projectid, :user_id, :user_assigned)
  end

end
