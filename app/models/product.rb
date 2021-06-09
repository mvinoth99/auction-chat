class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :bids
end
