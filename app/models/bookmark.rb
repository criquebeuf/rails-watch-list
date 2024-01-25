class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  # is unique for a given movie/list couple
  validates :list_id, uniqueness: { scope: :movie_id }
end
