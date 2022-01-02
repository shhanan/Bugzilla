class ProjectsController < ApplicationController
  def index
    @projects= Project.all
  end
  def show
    @project = Project.find(params[:id])
    @user=User.all
    @bug=Bug.all

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
  def add_user
    if @project.users << @user
      redirect_to @project
    else
      redirect_to @project, notice: "Can not add user to project"
    end
  end
  private
  def project_params
    params.require(:project).permit(:title, :description, :projectid, :user_id)
  end
end
