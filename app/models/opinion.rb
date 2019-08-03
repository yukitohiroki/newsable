class Opinion < ApplicationRecord
  belongs_to :clip
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  validates :name, presence: true
  validates :title, presence: true
  validates :body, presence: true
end