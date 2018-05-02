# frozen_string_literal: true

module CommunitiesHelper
  def join_or_leave(community)
    community.member?(current_profile) ? 'leave' : 'join'
  end
end
