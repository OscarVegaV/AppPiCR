class Place < ApplicationRecord
  has_many :pictures, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :name, presence: true

  acts_as_favoritable

end
