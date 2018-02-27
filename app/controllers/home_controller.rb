# frozen_string_literal: true

# This is the home controller which controls the home page
class HomeController < ApplicationController
  before_action :before_authenticate
  before_action :authenticate_user!

  def index; end

  private

  def before_authenticate
    redirect_to new_user_session_path unless user_signed_in?
  end
end
