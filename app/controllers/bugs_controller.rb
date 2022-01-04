class BugsController < ApplicationController
  load_and_authorize_resource
  def index
  @bugs=Bug.all
  end

  def new
    @bug = Bug.new
     @bug.project_id = params[:project_id]
  end

  def create
     #@bug = @project.new(bug_params)
     #@project = Project.id
     @bug = Bug.new(bug_params)
    if @bug.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @project = Project.find(params[:id])

  end

  def assign
    if @bug.update_attribute(:assign_to,current_user.id)
      redirect_to @bug , notice: "Assigned Successfully"
    else
      redirect_to @bug , notice: "Not Assigned"
    end
  end
  def bug_params
    params.require(:bug).permit(:descriptive_title,:deadline,:bug_type, :status, :project_id, :creator_id, :screenshot, )
  end
end
