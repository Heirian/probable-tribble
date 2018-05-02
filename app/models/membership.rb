class Membership < ApplicationRecord
  belongs_to :community
  belongs_to :member, class_name: 'Profile'

  enum status: %i[common moderator administrator]

  after_create :verify_approve_requeriment

  def verify_approve_requeriment
    update(approved: true) if !community.require_approval
  end
end
