class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		if current_user
			@article = Article.new
		else
			redirect_to log_in_path, :notice => "You must be logged in to create an article"
		end	
	end

	def edit
		if current_user && current_user == @article.user_id
			@article = Article.find(params[:id])
		else
			redirect_to articles_path, :notice => "You cannot edit this article"
		end
	end

	def create
		if current_user
			@article = Article.new(article_params)
			@article.user_id = current_user.id
			if @article.save
				redirect_to @article
			else
				render 'new'
			end
		else
			redirect_to log_in_path, :notice => "You must be logged in"
		end
	end

	def update
		@article = Article.find(params[:id])
		if current_user && current_user.id == @article.user_id
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
		@article = Article.find(params[:id])
		if current_user && current_user.id == @article.user_id
			@article.destroy
			redirect_to articles_path
		else
			redirect_to articles_path, :notice => "You cannot remove this article"
		end
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
