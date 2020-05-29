class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  validates_numericality_of :rating, only_integer: true
  validates_length_of :content, maximum: 250

end