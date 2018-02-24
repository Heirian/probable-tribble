# frozen_string_literal: true

# This is the profile model
class Profile < ApplicationRecord
  belongs_to :user

  enum gender: %I[#{I18n.t(:female)} #{I18n.t(:male)}]
end
