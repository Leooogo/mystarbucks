class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @drinks = Drink.joins(:reviews).select("*, avg(reviews.rating) as average_rating").group("drinks.id").order("average_rating DESC")
    # if @drink.reviews.present?
    #   @ratings = Review.where(drink_id: @drink).average(:drink).truncate(2)
    # else
    #   render 'show'
    # end
  end
end
