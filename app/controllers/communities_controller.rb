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
    if @community.save
      redirect_to @community
    else
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

  private

  def ensure_community
    @community = Community.find(ensure_instance_id)
  end

  def communities_params
    params.require(:community).permit(:name, :body, :kind, :require_approval,
                                      :owner_id, :game_id)
  end
end
