class Membership < ApplicationRecord
  belongs_to :community
  belongs_to :member, class_name: 'Profile'

  has_many :accepted_memberships, -> { where(memberships: { approved: true }) }, through: :memberships
  has_many :pending_memberships, -> { where(memberships: { approved: false }) }, through: :memberships
end
