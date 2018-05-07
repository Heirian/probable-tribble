# frozen_string_literal: true

# This is the profile model
class Profile < ApplicationRecord
  belongs_to :user
  has_many :articles
  has_many :memberships, foreign_key: "member_id"
  has_many :communities, foreign_key: :owner_id
  has_many :community_memberships, through: :memberships, source: :member
  accepts_nested_attributes_for :user
  has_many_attached :avatar
  validates :username, presence: true, length: { minimum: 3, maximum: 30 },
                       uniqueness: { case_sensitive: false }
  validates_with AvatarValidator

  delegate :email, :current_sign_in_at, to: :user

  enum gender: %i[female male]

  def join(community)
    community.members << self
  end

  def leave(community)
    community.members.delete(self)
  end

  def membership(community)
    memberships.where(community_id: community.id).first
  end
end
