class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments
  validates :title, :body, presence: true
end
