class ReviewsController < ApplicationController
  def new
    @drink = Drink.find(params[:drink_id])
    @review = Review.new
  end

  def create
    @drink = Drink.find(params[:drink_id])
    @review = Review.new(review_params)
    @review.drink = @drink

    respond_to do |format|
      if @review.save
        redirect_to drink_path(@drink, anchor: "review-#{@review.id}")
      else
        render 'drinks/show'
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
