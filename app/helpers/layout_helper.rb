# frozen_string_literal: true

# This is the layout helper
module LayoutHelper
  def action?(*action)
    action.include?(params[:action])
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def active_font_weight_bold(controller, action)
    'font-weight-bold' if controller?(controller) && action?(action)
  end

  def nav_bar
    user_signed_in? ? 'main_nav_bar' : 'unlogged_nav_bar'
  end
end
