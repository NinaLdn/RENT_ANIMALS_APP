class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.booking.user = current_user
    authorize @review
    if @review.save!
      redirect_to reservations_animals_path
      flash[:notice] = "Posted"
    else
      render 'new'
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
    redirect_to reservations_animals_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
