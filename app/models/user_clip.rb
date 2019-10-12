class UserClip < ApplicationRecord
  belongs_to :user
  belongs_to :clip, counter_cache: true
end
