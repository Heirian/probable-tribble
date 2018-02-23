# frozen_string_literal: true

# This is the layout helper
module LayoutHelper
  def nav_bar
    user_signed_in? ? 'main_nav_bar' : 'unlogged_nav_bar'
  end
end
