class Like < ApplicationRecord
  belongs_to :opinion
  belongs_to :clip
  belongs_to :user
end