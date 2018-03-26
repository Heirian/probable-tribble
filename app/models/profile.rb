# frozen_string_literal: true

# This is the profile model
class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  validates :name, presence: true, length: { minimum: 3, maximum: 30 },
                   uniqueness: { case_sensitive: false }

  enum gender: %i[female male]

end
