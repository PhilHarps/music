class Listing < ApplicationRecord
  validate :image_presence
  validate :correct_image
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

  def correct_image
      if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
            errors.add(:image, 'must be a JPEG or PNG file.')
      # elsif image.attached? == false
      #       errors.add(:image, 'must have an image attached')
      end
  end
end