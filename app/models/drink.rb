class Drink < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  has_many :favorite_drinks
  has_many :favorited_by, through: :favorite_drinks, source: :user

  def top_drinks
    @top_drinks = Drink.by_ratings.limit(3)
    scope :by_ratings, :joins => :reviews, :group => "drinks.id", :order => "AVG(reviews.rating) DESC"
  end

  # validate :file_size_under_one_mb

  # def initialize(params = {})
  #   @file = params.delete(:file)
  #   super
  #   if @file
  #     self.filename = sanitize_filename(@file.original_filename)
  #     self.content_type = @file.content_type
  #     self.file_contents = @file.read
  #   end
  # end

  # NUM_BYTES_IN_MEGABYTE = 1048576
  # def file_size_under_one_mb
  #   if(@file.size.to_f / NUM_BYTES_IN_MEGABYTE) > 1
  #     errors.add(:file, 'File size cannot be over one megabyte.')
  #   end
  # end

  # private

  # def sanitize_filename(filename)
  #   return File.basename(filename)
  # end

  # scope :by_rating, :joins => :reviews, :group => "drinks.id", :order => "AVG(reviews.rating) DESC"

  # def avg_rating
  #   review.average(:rating)
  # end

  # acts_as_favoritable
end
