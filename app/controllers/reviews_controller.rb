class ReviewsController < ApplicationController
  def new
    @drink = Drink.find(params[:drink_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @drink = Drink.find(params[:drink_id])
    @review.drink = @drink
    if @review.save
      redirect_to drink_path(@drink)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to drink_path(@review.drink)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
