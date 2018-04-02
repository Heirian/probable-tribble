class Category < ApplicationRecord
  translates :title
  has_many :articles
end
