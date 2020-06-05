class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :cost, presence: true
  validates :country, presence: true

  before_save(:titleize_product)

  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}

  scope :recently_added, -> {(
    where("created_at <=?", Time.now)
    .order("created_at DESC")
    .limit(3)
  )}

  scope :search, -> { where("country ilike ?", "%United States%")}


  private
    def titleize_product
      self.name = self.name.titleize
    end

end