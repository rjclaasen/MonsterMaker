class Monster < ApplicationRecord
  default_scope -> { order(name: :asc) }
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 255 }
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
