class ArticlesController < ApplicationController


  def index
    @articles = Article.page params[:page]
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Article updated successfully!"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @article = Article.new
  end

  def create

    @article =Article.new(article_params)

    if @article.save
      flash[:notice] = "Article created successfully!"
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article deleted successfully!"

    redirect_to article_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.new(article_params)
  end

end
