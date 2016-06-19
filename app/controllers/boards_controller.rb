class BoardsController < ApplicationController

	include SessionsHelper

	def index
		@boards = Board.limit(10)
		@board = Board.new
	end

	def show
		@board = Board.find_by(id: params[:id])
	end

	def new
		@board = Board.new
	end

	def edit
		@board = Board.find_by(id: params[:id])
	end

	def create
		@board = current_user.boards.build(board_params)
		if @board.save
			redirect_to @board
		else
			render 'new'
		end
	end

	def update
		@board = Board.find_by(id: params[:id])
    	if @board.update(board_params)
      		redirect_to @board
    	else
      		render 'edit'
    	end
	end

	def destroy
		@board = Board.find_by(id: params[:id])
		@board.destroy
		redirect_to boards_path
	end

private

def board_params
  params.require(:board).permit(:name)
end

end
