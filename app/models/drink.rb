class Drink < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  belongs_to :user, optional: true
  has_many :favorite_drinks
  has_many :favorited_by, through: :favorite_drinks, source: :user

  def top_drinks
    @top_drinks = Drink.by_ratings.limit(3)
    scope :by_ratings, :joins => :reviews, :group => "drinks.id", :order => "AVG(reviews.rating) DESC"
  end

  # scope :by_rating, :joins => :reviews, :group => "drinks.id", :order => "AVG(reviews.rating) DESC"

  # def avg_rating
  #   review.average(:rating)
  # end

  # acts_as_favoritable
end
