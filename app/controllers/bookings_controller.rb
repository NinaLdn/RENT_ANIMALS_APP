class BookingsController < ApplicationController
  # before_action :set_booking, only: [:accept_booking]

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
    @booking = Booking.new(booking_params)
    @booking.animal.id = booking_params[:animal_id]
    @booking.user = current_user
    if @booking.save
      redirect_to reservations_animals_path
      flash[:notice] = "your booking for was successfull"
    else
      render 'new'
    end
  end

  def accept_booking
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: params[:status])
    redirect_to ads_animals_path
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
    params.require(:booking).permit(:start_date, :end_date, :animal_id, :user_id, :total_price, :status, :message)
  end

end
