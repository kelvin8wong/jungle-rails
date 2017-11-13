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

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to @review.product
  end

  private

  def reviews_params
    params.require(:review).permit(
      :description,
      :rating)
  end
end
