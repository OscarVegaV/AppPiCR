class Place < ApplicationRecord
  has_many :pictures
  has_many :comments, as: :commentable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :name, presence: true
end
