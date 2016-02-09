class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @project = @task.project_id
    if @task.save
      redirect_to @task, notice: 'Task successfully created.'
    else
      render :new
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :description, :start_date, :due_date, :status)
    end
end
