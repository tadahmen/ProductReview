class ReviewsController < ApplicationController
  before_action :set_product

  def index
    # @rating = 0
    # @reviews = Review.all
    # @reviews.each do |r|
    #   @rating = @rating + r.rating
    # end

    render json: {
      meta: {
        count: @product.reviews.count,
        page: 0
      },
      reviews:
        @product.reviews.order(:name)
      # average: @rating
    }
  end


  def create
    review = Review.new(review_params)
    review.product = @product

    respond_to do |format|
      if review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        render json: { review: review }
      else
        format.html { render :new }
        render json: {
          message: "could not create new Review",
          errors: review.errors
        }, status: :unprocessible_entity
      end
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
