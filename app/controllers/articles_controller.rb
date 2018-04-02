# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :ensure_article, only: %i[show edit update destroy]
  before_action :ensure_create_article, only: [:create]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article.user_id = current_user
    if @article.save
      flash[:success] = 'Artigo criado'
      redirect_to article_path(@article)
    else
      flash[:error] = @article.errors.full_messages.join(' - ')
      render 'new'
    end
  end

  def edit; end

  def update
    if @article.update(articles_params)
      flash[:success] = 'Artigo atualizado'
      redirect_to article_path(@article)
    else
      flash[:error] = @article.errors.full_messages.join(' - ')
      render 'edit'
    end
  end

  def destroy
    if @article.user == current_user
      @article.destroy
      redirect_to articles_path
    else
      flash[:danger] = 'Você não pode fazer isso'
      redirect_to root_path
    end
  end

  private

  def ensure_article
    @article = Article.find(ensure_article_id)
  end

  def ensure_article_id
    params[:id].to_i
  end

  def ensure_create_article
    @article = Article.ew(articles_params)
  end

  def articles_params
    params.require(:category).permit(:title, :body, :profile_id,
                                     :game_id, :category_id)
  end
end
