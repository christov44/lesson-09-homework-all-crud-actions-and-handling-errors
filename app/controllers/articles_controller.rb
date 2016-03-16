class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to article_path(@article), notice: "Article was successfully created"
    else
      flash.now[:error] = "An error occurred, what'd you do!?"
      render :new
    end
    
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Hope you're a better author because you updated the article"
    else
      flash.now[:error] = "An error occurred, what'd you do!?"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
