class ReviewsController < ApplicationController
# before_action :set_booking, only: %i[new create]
  def index
    @reviews = Review.all
  end

  def new
    @booking = Booking.find(params[:bookings_id])
    @review = Review.new
    authorize @review
  end

  def create
        @booking = Booking.find(params[:bookings_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to planet_path(@booking.planet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # def set_booking
  #   @booking = Booking.find(params[:booking_id])
  # end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
