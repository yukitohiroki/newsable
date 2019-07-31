class Opinion < ApplicationRecord
  belongs_to :clip
  has_many :comments, dependent: :delete_all
  # validates :title, presence: true
  # validates :body, presence: true
end