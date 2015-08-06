class CommentsController < ApplicationController

	def create
		if current_user
			@article = Article.find(params[:article_id])
			@comment = @article.comments.new(comment_params)
			@comment.user_id = current_user.id
			if @comment.save
				redirect_to article_path(@article)
			else
				render 'create'
			end
		else
			redirect_to log_in_path, :notice => "You need to log in to comment"
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		if current_user != nil && current_user.id == @comment.user_id
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
