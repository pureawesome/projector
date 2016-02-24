class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking successfully created.'
    else
      flash.now[:alert] = "Booking not create"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking successfully updated.'
    else
      flash.now[:alert] = "Booking not updated"
      render :edit
    end
  end

  private
    def booking_params
      params.require(:booking).permit(:project_id, :resource_id, :start_datetime, :end_datetime)
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end
end
