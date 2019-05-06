class Listing < ApplicationRecord
  validate :image_presence
  belongs_to :user
  has_one_attached :image

  validates :name, :description, presence: true
  validates_inclusion_of :condition, :in => 1..5
  validates :price, numericality: true
  validates_length_of :year, is: 4, message: "A year must be a four-digit integer."
  validates :instrument_type, inclusion: { in: %w(Brass String Percussion) }, allow_nil: false

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end