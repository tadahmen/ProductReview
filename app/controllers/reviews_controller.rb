class ReviewsController < ApplicationController

  def index
    @rating = 0
    @reviews = Review.all
    @reviews.each do |r|
      @rating = @rating + r.rating
    end

    render json: {
      meta: {
        count: Review.count,
        page: 0
      },
      reviews:
        Review.order(:name)
      # average: @rating
    }
  end

  def show
    review = Review.find(params[:id])
      render json: {
        review: review
      }
  end

  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def review_params
    params.require(:review).permit(:name, :description, :shop)
  end
end
