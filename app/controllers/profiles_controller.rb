# frozen_string_literal: true

# This is the profiles controller which controls the profiles pages
class ProfilesController < ApplicationController
  # before_action :authenticate_user!
  before_action :ensure_profile, except: [:index]

  def index; end

  def show
    respond_to do |format|
      format.html
      format.json { render json: { profile: Profiles::ShowPresenter.new(@profile).to_json, avatar: avatar_url } }
    end
  end

  def edit; end

  def update
    @profile.avatar.attach(params[:avatar]) if params[:avatar].present?
    if @profile.update(profile_params)
      flash[:success] = 'Perfil salvo'
      redirect_to profile_path(@profile)
    else
      flash.now[:error] = @profile.errors.full_messages.join(' - ')
      render :edit
    end
  end

  private

  def ensure_profile
    @profile = Profile.includes(:user).find(ensure_instance_id)
  end

  def profile_params
    params.require(:profile).permit(:gender, :avatar, :name,
                                    :username, :bio, :phone,
                                    :birthday, user_attributes: %i[id email])
  end

  def avatar_url
    @profile.main_avatar.present? ? url_for(@profile.main_avatar) : ActionController::Base.helpers.asset_path('profile-cover.jpg')
  end
end
