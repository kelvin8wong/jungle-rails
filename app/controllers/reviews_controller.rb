class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    review = @product.reviews.new(reviews_params)
    review.user = current_user
    if review.save
      redirect_to @product
    end
  end

  private

  def reviews_params
    params.require(:review).permit(
      :description,
      :rating)
  end
end
