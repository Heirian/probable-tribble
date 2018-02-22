class Profile < ApplicationRecord
  belongs_to :user

  enum gender: %i[female male]
end
