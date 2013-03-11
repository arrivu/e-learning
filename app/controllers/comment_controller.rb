class CommentController < ApplicationController

	def create
	@comment = Comment.new(params[:comment])
		if @comment.save
	 flash.now[:notice] = "Successfully created..."
		else
		render 'comment'
		flash.now[:notice] = "error"
	end
	end
end
