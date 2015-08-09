class ArticlesController < ApplicationController
	before_action :authorize, except: [:index, :show]
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.all
	end

	def show
	end

	def new
		@article = Article.new
	end

	def edit
		if current_user.id != @article.user_id
			redirect_to articles_path, notice: "You cannot edit this article"
		end
	end

	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		if current_user.id == @article.user_id
			if @article.update(article_params)
				redirect_to @article
			else
				render 'edit'
			end
		else
			redirect_to @article
		end
	end

	def destroy
		if current_user.id == @article.user_id
			@article.destroy
			redirect_to articles_path
		else
			redirect_to articles_path, :notice => "You cannot remove this article"
		end
	end

	private
	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :text)
	end
end
