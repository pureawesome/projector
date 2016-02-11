class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project successfully created.'
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @tasks = Task.where(:project_id === @project.id)
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :start_date, :end_date_projected, :budget)
    end
end
