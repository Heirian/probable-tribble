# frozen_string_literal: true

class GenresController < ApplicationController
  before_action :ensure_genre, only: %i[show edit update]
  before_action :ensure_create_genre, only: [:create]

  def index
    @genres = Genre.includes(:translations).all
  end

  def show; end

  def new
    @genre = Genre.new
  end

  def create
    if @genre.save
      flash[:success] = 'Genero criado'
      redirect_to genre_path(@genre)
    else
      flash[:danger] = @genre.errors.full_messages.join(' - ')
      render 'new'
    end
  end

  def edit; end

  def update
    if @genre.update(genres_params)
      flash[:success] = 'Genero atualizado'
      redirect_to genre_path(@genre)
    else
      flash[:danger] = @genre.errors.full_messages.join(' - ')
      render 'edit'
    end
  end

  private

  def ensure_create_genre
    @genre = Genre.new(genres_params)
  end

  def ensure_genre
    @genre = Genre.includes(:translations).find(ensure_instance_id)
  end

  def genres_params
    params.require(:genre).permit(:title)
  end
end
