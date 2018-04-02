class Game < ApplicationRecord
  translates :title, :description, :body
  has_many :articles
  has_many :game_developers
  has_many :developers, through: :game_developers
  has_many :game_genres
  has_many :genres, through: :game_genres
end
