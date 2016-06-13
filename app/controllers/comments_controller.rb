class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def edit
		@comment = Comment.find_by(id: params[:id])
	end

	def create
		@card = Card.find_by(id: params[:id])
		@comment = @card.comments.new(comment_params)
		if @comment.save
			redirect_to @card
		else
			render 'new'
		end
	end

	def update
		@card = Card.find_by(id: params[:id])
		@comment = @card.comments.find_by(id: params[:id])
		if @comment.update(comment_params)
			redirect_to @card
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
