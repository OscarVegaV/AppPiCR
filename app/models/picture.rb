class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  belongs_to :place
  has_one_attached :photo

  validates :photo, presence: true

  acts_as_favoritable
  
end
