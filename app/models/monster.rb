class Monster < ApplicationRecord
  self.inheritance_column = :_type

  belongs_to :user, optional: true
  alias_attribute :author, :user
  has_many :traits
  has_many :actions
  has_many :reactions

  default_scope -> { order(name: :asc) }
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 255 }
  validates :strength, :dexterity, :constitution, :intelligence, :wisdom, 
    :charisma, numericality: { only_integer: true, allow_nil: true }
  validate  :picture_size

  accepts_nested_attributes_for :traits, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :actions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :reactions, reject_if: :all_blank, allow_destroy: true
  validates_associated :traits
  validates_associated :actions
  validates_associated :reactions

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
