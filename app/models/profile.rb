# frozen_string_literal: true

# This is the profile model
class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 30 },
                   uniqueness: { case_sensitive: false }

  enum gender: %I[#{I18n.t(:female)} #{I18n.t(:male)}]
end
