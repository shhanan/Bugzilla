class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user.user_type == 'developer'
      byebug
      @pro=ProjectUser.where(user_id:current_user.id).pluck(:project_id)
      @projects=Project.where(id: @pro)
    else
    @projects = Project.accessible_by(current_ability)
    end
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
