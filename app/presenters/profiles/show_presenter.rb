# frozen_literal_string: true

module Profiles
  class ShowPresenter
    attr_reader :username

    def initialize(profile)
      @username = profile.username
      @bio = profile.bio
      @member_since = profile.created_at
    end
  end
end
