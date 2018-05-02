# frozen_string_literal: true

class MembershipsController < ApplicationController
  def create
    @community = Community.find(params[:community_id])
    current_profile.join(@community)
    redirect_to @community
  end

  def update
    @membership = Membership.find(params[:id])
    @membership.update(membership_params)
    redirect_to @membership.community
  end

  def destroy
    @membership = Membership.find(params[:id])
    @community = @membership.community
    @membership.member.leave(@community)
    redirect_to @community
  end

  private

  def membership_params
    params.require(:membership).permit(:approved, :status)
  end
end
