# frozen_string_literal: true

# This is the home controller which controls the home page
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
