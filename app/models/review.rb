class Review < ApplicationRecord
  belongs_to :drink

  validates :content, presence: true
end
