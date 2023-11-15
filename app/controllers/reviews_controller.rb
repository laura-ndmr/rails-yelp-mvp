class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]
  before_action :set_review, only: [:destroy]

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.new(review_params)
    @review.save!
    redirect_to @restaurant
  end

  def destroy
    @review.destroy
    redirect_to @restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
