# frozen_string_literal: true

# This is the users helper
module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 150, class: 'gravatar' })
    size = options[:size]
    img_class = options[:class]
    if user.profile.avatar.attached?
      gravatar_url = user.profile.avatar.last.variant(resize: "#{size}x#{size}")
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    end
    image_tag(gravatar_url, size: size, class: img_class)
  end
end
