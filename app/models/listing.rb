class Listing < ApplicationRecord
  belongs_to :breed
  has_one_attached :picture
  enum sex: { female: 0, male: 1 }
  validates :sex, presence: true
end
