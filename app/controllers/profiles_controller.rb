# frozen_string_literal: true

# This is the profiles controller which controls the profiles pages
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_profile, except: [:index]

  def index; end

  def show; end

  def edit; end

  def update
    return render 'edit' unless @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def ensure_profile
    @profile = Profile.find(ensure_profile_id)
  end

  def ensure_profile_id
    params[:id].to_i
  end

  def profile_params
    params.require(:profile).permit(:gender)
  end
end
