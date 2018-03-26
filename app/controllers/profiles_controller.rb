# frozen_string_literal: true

# This is the profiles controller which controls the profiles pages
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_profile, except: [:index]

  def index; end

  def show; end

  def edit; end

  def update
    if params[:avatar].present?
      if @profile.avatar.attached?
        @profile.avatar.purge
      end
      @profile.avatar.attach(params[:avatar])
    end
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      flash[:danger] = @profile.errors.full_messages
      render 'edit'
    end
  end

  private

  def ensure_profile
    @profile = Profile.includes(:user).find(ensure_profile_id)
  end

  def ensure_profile_id
    params[:id].to_i
  end

  def profile_params
    params.require(:profile).permit(:gender, :avatar, :name,
                                    :username, :bio, :phone,
                                    :birthday, user_attributes: [:id, :email])
  end
end
