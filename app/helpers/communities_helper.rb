# frozen_string_literal: true

module CommunitiesHelper
  def community_avatar(community, options = { size: 150, class: 'gravatar' })
    size = options[:size]
    html_class = options[:class]

    image_tag(avatar_url(community, size), size: size, class: html_class)
  end

  def avatar_url(community, size)
    return avatar_fallback unless community.avatar.attached?

    community.avatar.last.variant(resize: "#{size}x#{size}")
  end

  def avatar_fallback
    asset_path('logoback.png')
  end

  def join_or_leave(community)
    community.member?(current_profile) ? 'leave' : 'join'
  end

  def request_time_in_words(member, community)
    t(:request, count: 2) + ' ' + member_since(member, community) + ' ' + t(:ago)
  end

  def join_time_in_words(member, community)
    t(:join, count: 2) + ' ' + member_since(member, community) + ' ' + t(:ago)
  end

  def membership(member, community)
    member.membership(community)
  end

  def member_since(member, community)
    time_ago_in_words(membership(member, community).created_at)
  end
end
