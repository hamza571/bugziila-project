class BugsController < ApplicationController


  def assignbug
    bug = Bug.find(params[:bug_id])
    bug.update(developer_id: current_user.id, status:"started")
    redirect_to user_projects_path(params[:project_id])
    
  end
  def index
  	@bugs=Bug.all
    @project = Project.find(params[:project_id])
  end

  def show
  	@bug=Bug.find(params[:id])

  end

  def new
  	@bug=Bug.new
  end

  def create
  	@bug=Bug.new(bug_params)

    @bug.creator_id = current_user.id
    @bug.project_id = Project.find(params[:project_id]).id

    if @bug.save
      redirect_to user_project_bugs_path
    else
      render 'new'
    end

    
  end

  def edit
  	@bug=Bug.find(params[:id])

  end

  def update
  	@bug=Bug.find(params[:id])
    @bug.update(bug_params)
  	redirect_to user_project_bugs_path
  end

  def destroy
    @bug=Bug.find(params[:id])
    @bug.destroy
    redirect_to user_project_bugs_path
	end

   private
	def bug_params
		params.require(:bug).permit(:title,:deadline, :image, :types, :status)
	end
end
