class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :edit]

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
    @tasks = Task.where(:project_id === @project.id)
    # @tasks = @project.tasks
  end

  def edit

  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project successfully updated.'
    else
      render :edit
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :start_date, :end_date_projected, :budget)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
