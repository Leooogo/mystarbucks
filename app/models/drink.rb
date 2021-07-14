class Drink < ApplicationRecord
  has_many :drink_reviews, dependent: :destroy
  has_one_attached :photo
  # acts_as_favoritable
end
