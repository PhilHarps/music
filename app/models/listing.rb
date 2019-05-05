class Listing < ApplicationRecord
  validate :image_presence
  belongs_to :user
  has_one_attached :image

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
