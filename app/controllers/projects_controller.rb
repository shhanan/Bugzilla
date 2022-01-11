class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user.user_type == 'developer'
      @pro=ProjectUser.where(user_id:current_user.id).pluck(:project_id)
      @projects=Project.where(id: @pro)
    else
    @projects = Project.accessible_by(current_ability)
    end
  end
  def show
    @project_id = Project.find(params[:id])
    @bugs=Bug.where(project_id: @project_id)
    @p_user=ProjectUser.where(project_id: @project_id).pluck(:user_id)

    @project_username=User.where(id:@p_user)
     @user=User.all
     @project_user=ProjectUser.where(user_id:@p_user)
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
  def removeuser
    @project_id = params[:project_id]
    @user_id = params[:user_id]
    @project_user=ProjectUser.where(project_id:@project_id,user_id:@user_id).pluck(:id)
    if ProjectUser.destroy(@project_user)
      redirect_to '/projects'
    end
  end
  private
  def project_params
    params.require(:project).permit(:title, :description, :projectid, :user_id, :user_assigned)
  end

end
