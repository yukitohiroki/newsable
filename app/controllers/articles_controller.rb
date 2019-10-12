class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]  
  # GET /articles
  # GET /articles.json
  def index
    require "api_helper"

    uri1 = URI.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=9f88e3748ec14d1a98204072a6aa8833')
    json1 = Net::HTTP.get(uri1)
    result_us = JSON.parse(json1)
    @articles = Article.new
    @articles = result_us['articles']
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @articles = Article.all
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    post_text = params[:data][:text]
    results = { :message => post_text }
    render partial: 'ajax_partial', locals: { :results => results }
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, category_ids: [])
    end
end
