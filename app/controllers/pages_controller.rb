class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @drinks = Drink.all

    @ratings = @drinks.each {|drink| drink.reviews.average(:rating).to_f}
    @ranked_ratings = @ratings.sort_by {|rating| rating}
    @top_seven = @ranked_ratings.reverse[0..7]
  end
end
