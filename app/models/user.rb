class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # , :confirmable
  has_many :user_clips
  has_many :clips, through: :user_clips
  has_many :opinions, dependent: :destroy
  has_many :likes, dependent: :destroy
end
