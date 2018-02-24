# frozen_string_literal: true

# This is the profiles helper
module ProfilesHelper
  def current_profile
    current_user.profile
  end
end
