class Post < ApplicationRecord
  belongs_to :user
  validates :need, {presence: true, length: {maximum: 50}}
  validates :notneed, {presence: true, length: {maximum: 50}}
end
