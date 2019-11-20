class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :category, presence: true
  validates :user_id, presence: true
end
