class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :update, :edit]

  def index
    @tasks = @project.tasks.all
  end

  def new
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to [@project, @task], notice: 'Task successfully created.'
    else
      flash.now[:alert] = "Task not saved" # flash.now because it is just a render not a redirect
      render :new
    end
  end

  def show
    @user = User.find(@task(:user_id))
  end

  def edit

  end

  def update
    if @task.update(task_params)
      redirect_to [@project, @task], notice: 'Task successfully updated.'
    else
      render :edit
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :description, :start_date, :due_date, :status)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end
end
