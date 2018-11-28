class BookingsController < ApplicationController
  # before_action :set_booking, only: [:show, :create, :destroy, :create]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    @booking.user = current_user
    if @booking.save!
      redirect_to animal_path(@animal)
      flash[:notice] = "Booking successfull"
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to animals_path
  end

  def reservations
    # @animal = Animal.find(params[:animal_id])
    @bookings = Booking.where(user: current_user)
  end

  private

  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :animal_id, :user_id)
  end

end
