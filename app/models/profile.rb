# frozen_string_literal: true

# This is the profile model
class Profile < ApplicationRecord
  belongs_to :user

  enum gender: %i[female male]
end
