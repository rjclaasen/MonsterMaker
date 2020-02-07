class Monster < ApplicationRecord
  has_many :traits
  has_many :actions

  default_scope -> { order(name: :asc) }
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 255 }
  validate  :picture_size

  accepts_nested_attributes_for :traits, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :actions, reject_if: :all_blank, allow_destroy: true
  validates_associated :traits
  validates_associated :actions

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
