class Community < ApplicationRecord
  belongs_to :owner, class_name: 'Profile'
  belongs_to :game
  has_many :memberships
  has_many :members, through: :memberships

  has_many_attached :avatar
  validates_with AvatarValidator

  delegate :username, to: :owner

  enum secrecy: %i[common vip secret]
  enum kind: %i[pub strategy fun]

  delegate :title, to: :game, prefix: true

  after_create :owner_membership

  def accepted_member?(profile)
    accepted_members.include?(profile)
  end

  def accepted_members
    members.where(memberships: { approved: true })
  end

  def pending_members
    members.where(memberships: { approved: false })
  end

  def managers_members
    accepted_members.where(memberships: { status: manager_status })
  end

  def member?(profile)
    members.include?(profile)
  end

  def manager?(profile)
    accepted_member?(profile) && manager_status?(profile)
  end

  def manager_status?(profile)
    membership(profile).status.in?(manager_status)
  end

  def membership(profile)
    memberships.where(member_id: profile.id).last
  end

  private

  def manager_status
    ['administrator', 'moderator']
  end

  def owner_membership
    memberships.create(member: owner, approved: true, status: 2)
  end
end
