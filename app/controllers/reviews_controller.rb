class ReviewsController < ApplicationController
  before_action :set_product
  skip_before_action :verify_authenticity_token

  def index
    # sum_reviews = 0
    #
    # @product.reviews.each do |review|
    #   sum_reviews += review.rating
    # end
    #
    # average_rating = sum_reviews/@product.reviews.count

    render json: {
      meta: {
        count: @product.reviews.count,
        page: 0
      },
      reviews: @product.reviews.order(:created_at),
      # average_rating: average_rating
    }
  end


  def create
    review = Review.new(review_params)
    review.product = @product

    if review = review.save
      render json: { review: review }
    else
      render json: {
        message: "Could not create new Review",
        errors: review.errors
      }, status: :unprocessible_entity
    end
  end

private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:name, :rating, :reviewText)
  end
end
