class Song < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :video, presence: true
  
  mount_uploader :video, VideoUploader
  belongs_to :user
end
