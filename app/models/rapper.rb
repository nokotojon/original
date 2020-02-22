class Rapper < ApplicationRecord
  has_many :votes
  has_many :vote_users, through: :votes, source: 'user'
  mount_uploader :image, ImageUploader
end