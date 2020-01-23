class Property < ApplicationRecord
  belongs_to :monster, optional: false

  validates :name, presence: true, length: { maximum: 255 }
end
