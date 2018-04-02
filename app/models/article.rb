class Article < ApplicationRecord
  belongs_to :profile
  belongs_to :game
  belongs_to :category
end
