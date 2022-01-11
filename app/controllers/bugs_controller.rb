class BugsController < ApplicationController
  load_and_authorize_resource
  def index
  @bugs=Bug.where(assign_to:current_user.id)
  end

  def new
    @bug = Bug.new
     @project_id = params[:project_id]
  end

  def create
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
    @bug = Bug.find(params[:id])

  end
  def destroy
     @bug = Bug.find(params[:id])
     @bug.destroy
     redirect_to projects_path
  end
  def assign
      @bug = Bug.find(params[:id])
    if @bug.update_attribute(:assign_to,current_user.id)
        @bug.update_attribute(:status,"started")
      redirect_to '/dashboard'
    else
      redirect_to @bug , notice: "Not Assigned"
    end
  end
  def change_status
  @bug = Bug.find(params[:id])
    if @bug.update_attribute(:status,"resolved")
      redirect_to '/dashboard'
    else
      redirect_to @bug , notice: "Not Assigned"
    end

  end
  def bug_params
    params.require(:bug).permit(:descriptive_title,:description,:deadline,:bug_type, :status, :project_id, :creator_id, :screenshot,:assign_to)
  end
end
