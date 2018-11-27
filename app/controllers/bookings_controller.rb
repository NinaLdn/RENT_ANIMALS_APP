class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :create]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    if @booking.save
      redirect_to_animal_path(@animal)
    else
      render 'new'
    end
  end

  def destroy
    @booking.destroy
    redirect_to animals_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :animal_id, :user_id)
  end

end
