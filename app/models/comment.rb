class Comment < ApplicationRecord
  belongs_to :opinion
  validates :commenter, presence: true
  validates :body, presence: true
end