class ProjectsController < ApplicationController
  
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def assign
    @project = Project.find(params[:project_id])
    @assigned_users = @project.users
    users = User.all
    @remove_user = users - @assigned_users
  end

  def assignproject
    user = User.find(params[:id])
    project = Project.find(params[:project_id])
    user.projects << project
    redirect_to user_projects_path
  end

  def removeproject
    projectuser = Projectuser.find_by(user_id: params[:id], project_id: params[:project_id])
    projectuser.destroy
    redirect_to user_project_assign_path
  end

 
  
  def index
    @projects = current_user.projects
  end

  def show
    #@project = Project.find(params[:project_id])
    @bugs = @project.bugs
    @prusers =@project.users
  end

 
  def new
    @project =Project.new
  
  end

  def edit
  end


  def create
    @project = Project.new(project_params)
    current_user.projects << @project
    @project.save
    redirect_to user_projects_path
  end

  def update
    if @project.update(project_params)
      redirect_to user_projects_path
    else
      render 'edit'
    end
  end


  def destroy
    @project.destroy
    redirect_to user_projects_path
  end

   private
 
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end