class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings, dependent: :destroy
  has_one_attached :avatar

  validates :name, :address, :email, :city, :state, presence: true

  # Added 12 May 2019 to validate 
  validate :avatar_presence
  validate :correct_avatar

  # check whether avatar exists
    def avatar_presence
      errors.add(:avatar, "can't be blank") unless avatar.attached?
    end

    # check whether avatar file type is acceptable
    def correct_avatar
      if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png))
            errors.add(:avatar, 'must be a JPEG or PNG file.')
      end
    end
end