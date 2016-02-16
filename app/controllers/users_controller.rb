class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User successfully created.'
    else
      render :new
    end
  end

  def show
    @tasks = @user.tasks
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User successfully updated.'
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :role, :status)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
