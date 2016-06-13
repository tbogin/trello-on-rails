class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def edit
		@comment = Comment.find_by(id: params[:id])
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to @comment
		else
			render 'new'
		end
	end

	def update
		@comment = Comment.find_by(id: params[:id])
		if @comment.update(comment_params)
			redirect_to @comment
		else
			render 'edit'
		end
	end

	def destroy
		@comment = Comment.find_by(id: params[:id])
		@comment.destroy
		redirect_to comments_path
	end

private

def comment_params
  params.require(:comment).permit(:body)
end

end
