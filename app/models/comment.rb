class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  acts_as_favoritable
  
end
