# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :ensure_category, only: %i[show edit update]
  before_action :ensure_create_category, only: [:create]

  def index
    @categories = Category.includes(:translations).all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    if @category.save
      flash[:success] = 'Categoria criada'
      redirect_to category_path(@category)
    else
      flash[:danger] = @category.errors.full_messages.join(' - ')
      render 'new'
    end
  end

  def edit; end

  def update
    if @category.update(categories_params)
      flash[:success] = 'Categoria atualizada'
      redirect_to category_path(@category)
    else
      flash[:danger] = @category.errors.full_messages.join(' - ')
      render 'edit'
    end
  end

  private

  def ensure_create_category
    @category = Category.new(categories_params)
  end

  def ensure_category
    @category = Category.includes(:translations).find(ensure_category_id)
  end

  def ensure_category_id
    params[:id].to_i
  end

  def categories_params
    params.require(:category).permit(:title)
  end
end
