class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :pictures
  has_many :comments, as: :commentable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_favoritor

end
