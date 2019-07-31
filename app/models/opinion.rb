class Opinion < ApplicationRecord
  belongs_to :clip
  has_many :comments, dependent: :delete_all
end