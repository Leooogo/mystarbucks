class Review < ApplicationRecord
  belongs_to :drink

  validates :rating, presence: true
end
