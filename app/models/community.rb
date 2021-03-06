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

  def accepted_members_quantity
    accepted_members.count
  end

  def random_accepted_members(quantity)
    accepted_members.order('random()').last(quantity)
  end

  def pending_members
    members.where(memberships: { approved: false })
  end

  def pending_members?
    pending_members.any?
  end

  def pending_members_quantity
    pending_members.count
  end

  def random_pending_members(quantity)
    pending_members.order('random()').last(quantity)
  end

  def managers_members
    accepted_members.where(memberships: { status: manager_status })
  end

  def member?(profile)
    members.include?(profile)
  end

  def require_managers_approval?
    membership_approval
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

  def owner?(profile)
    owner == profile
  end

  private

  def manager_status
    %w(administrator moderator)
  end

  def owner_membership
    memberships.create(member: owner, approved: true, status: 2)
  end
end
