class Community < ApplicationRecord
  belongs_to :owner, class_name: 'Profile'
  belongs_to :game
  has_many :memberships
  has_many :members, through: :memberships

  delegate :username, to: :owner

  def game_title
    game.title
  end
end
