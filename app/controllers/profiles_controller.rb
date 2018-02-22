# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_profile, except: [:index]

  def index; end

  def show; end

  private

  def ensure_profile
    @profile = Profile.find(ensure_profile_id)
  end

  def ensure_profile_id
    params[:id].to_i
  end
end
