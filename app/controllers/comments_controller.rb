class CommentsController < ApplicationController
	before_action :authorize

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to article_path(@article)
		else
			render 'create'
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		if current_user.id == @comment.user_id
			@comment.destroy
			redirect_to article_path(@article), :notice => "Successfully deleted the comment"
		else
			redirect_to article_path(@article), :notice => "You don't own this comment"
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end
