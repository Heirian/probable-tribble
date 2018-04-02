# frozen_string_literal: true

class DevelopersController < ApplicationController
  before_action :ensure_developer, only: %i[show edit update]
  before_action :ensure_create_developer, only: [:create]

  def index
    @developers = Developer.all
  end

  def show; end

  def new
    @developer = Developer.new
  end

  def create
    if @developer.save
      flash[:success] = 'Desenvolvedor adicionado'
      redirect_to developer_path(@developer)
    else
      flash.now[:error] = @developer.errors.full_messages.join(' - ')
      render 'new'
    end
  end

  def edit; end

  def update
    if @developer.update(developer_params)
      flash[:success] = 'Desenvolvedor atualizado'
      redirect_to developer_path(@developer)
    else
      flash.now[:error] = @developer.errors.full_messages.join(' - ')
      render 'edit'
    end
  end

  private

  def developer_params
    params.require(:developer).permit(:name, :website)
  end

  def ensure_developer
    @developer = Developer.find(ensure_developer_id)
  end

  def ensure_developer_id
    params[:id].to_i
  end

  def ensure_create_developer
    @developer = Developer.new(developer_params)
  end
end
