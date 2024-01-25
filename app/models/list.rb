class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # should destroy child saved movies when destroying self
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
