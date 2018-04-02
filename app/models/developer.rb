class Developer < ApplicationRecord
  has_many :game_developers
  has_many :games, through: :game_developers
end
