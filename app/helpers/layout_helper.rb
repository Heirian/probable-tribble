module LayoutHelper
  def nav_bar
    user_signed_in? ? 'main_nav_bar' : 'unlogged_nav_bar'
  end
end
