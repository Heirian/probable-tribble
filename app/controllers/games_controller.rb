# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :ensure_game, only: %i[show edit update]
  before_action :ensure_create_game, only: [:create]

  def index
    @games = Game.includes(:translations, genres: [:translations]).all
  end

  def show; end

  def new
    @game = Game.new
  end

  def create
    if @game.save
      flash[:success] = 'Jogo criado'
      redirect_to game_path(@game)
    else
      flash.now[:error] = @game.errors.full_messages.join(' - ')
      render 'new'
    end
  end

  def edit; end

  def update
    if @game.update(game_params)
      flash[:success] = 'Jogo atualizado'
      redirect_to game_path(@game)
    else
      flash.now[:error] = @game.errors.full_messages.join(' - ')
      render 'edit'
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :body,
                                 :website, :release,
                                 :mode, genre_ids: [], developer_ids: [])
  end

  def ensure_game
    @game = Game.includes(:translations, genres: [:translations]).find(ensure_game_id)
  end

  def ensure_game_id
    params[:id].to_i
  end

  def ensure_create_game
    @game = Game.new(game_params)
  end
end
