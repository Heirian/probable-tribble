# frozen_string_literal: true

class MembershipsController < ApplicationController
  before_action :ensure_membership, only: %i[update destroy]

  def create
    @community = Community.find(params[:community_id])
    current_profile.join(@community)
    redirect_to @community
  end

  def update
    @membership.update(membership_params)
    redirect_to @membership.community
  end

  def destroy
    @community = @membership.community
    @membership.member.leave(@community)
    redirect_to @community
  end

  private

  def membership_params
    params.require(:membership).permit(:approved, :status)
  end

  def ensure_membership
    @membership = Membership.find(ensure_instance_id)
  end
end
