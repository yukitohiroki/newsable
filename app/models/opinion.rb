class Opinion < ApplicationRecord
  belongs_to :clip, counter_cache: true
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, dependent: :destroy
  validates :title, :body, presence: true
end