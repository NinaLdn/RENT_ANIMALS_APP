class BookingsController < ApplicationController
  # before_action :set_booking, only: [:accept_booking]
  skip_after_action :verify_authorized, only: [:reservations, :accept_booking]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.animal.id = booking_params[:animal_id]
    @booking.user = current_user
    authorize @booking
    if @booking.save
      flash[:notice] = "your booking was successfull"
      redirect_to reservations_animals_path
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
    @review = Review.new
  end

  private

  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :animal_id, :user_id, :total_price, :status, :message)
  end

end
