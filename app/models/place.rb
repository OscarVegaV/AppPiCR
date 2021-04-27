class Place < ApplicationRecord
  has_many :pictures

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :name, presence: true
end
