# frozen_string_literal: true

class CommunitiesController < ApplicationController
  before_action :ensure_communities, only: :index
  before_action :ensure_community, except: %i[index new create]

  def index; end

  def show; end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(communities_params)
    @community.owner = current_profile
    if @community.save
      redirect_to @community
    else
      flash.now[:error] = @community.errors.full_messages.join(' - ')
      render 'new'
    end
  end

  def edit; end

  def update
    if @community.update(communities_params)
      redirect_to @community
    else
      render 'edit'
    end
  end

  def destroy; end

  def pending_members; end

  def members; end

  private

  def communities_params
    params.require(:community).permit(:name, :body, :kind, :require_approval,
                                      :owner_id, :game_id, :membership_approval)
  end

  def ensure_community
    @community = Community.find(ensure_instance_id)
  end

  def ensure_communities
    @communities = Community.where(`true`)
  end
end
