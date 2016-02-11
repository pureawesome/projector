class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new(:project_id=>params[:project_id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to project_task_url(params[:project_id], @task.id), notice: 'Task successfully created.'
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  private
    def task_params
      params.require(:task).permit(:name, :description, :start_date, :due_date, :status)
    end
end
