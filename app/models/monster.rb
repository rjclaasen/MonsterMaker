class Monster < ApplicationRecord
  belongs_to :user
  default_scope -> { order(name: :asc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
