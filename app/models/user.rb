class User < ApplicationRecord
  validates :name, presence: true,
                   length: {maximum: 15}
  validates :email, presence: true,
                    format: {with: /[a-zA-Z0-9.+]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*/}
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}, allow_nil: true
  
  has_secure_password
  
  has_many :songs
  has_many :favorites
  has_many :favorite_songs, through: :favorites, source: 'song'
  mount_uploader :image, ImageUploader
  has_many :comments
end
