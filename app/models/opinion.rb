class Opinion < ApplicationRecord
  belongs_to :clip, counter_cache: true
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  validates :title, :body, presence: true
end