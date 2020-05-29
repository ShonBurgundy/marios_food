class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :cost, presence: true
  validates :country, presence: true

  before_save(:titleize_product)

  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, count(reviews.id) as reviews_count")
    .join(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}


  private
    def titleize_product
      self.name = self.name.titleize
    end

end