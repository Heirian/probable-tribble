class Community < ApplicationRecord
  belongs_to :owner, class_name: 'Profile'
  belongs_to :game
  has_many :memberships
  has_many :members, through: :memberships

  delegate :username, to: :owner

  enum secrecy: %i[vip secret common]
  enum kind: %i[strategy fun]

  def game_title
    game.title
  end
end
