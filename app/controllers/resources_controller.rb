class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :update, :edit]

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to @resource, notice: 'Resource successfully created.'
    else
      render :new
    end
  end

  def show
  end

  private
    def resource_params
      params.require(:resource).permit(:name, :description)
    end

    def set_resource
      @resource = Resource.find(params[:id])
    end
end
