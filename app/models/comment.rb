class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  # validates :id, presence: true
  # validates :commentable, presence: true
end
