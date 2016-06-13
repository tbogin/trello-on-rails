class CardsController < ApplicationController
	def show
		@card = Card.find_by(id: params[:id])
	end

	def new
		@card = Card.new
	end

	def edit
		@card = Card.find_by(id: params[:id])
	end

	def create
		@board = Board.find_by(id: params[:id])
		@card = @board.cards.new(card_params)
		if @card.save
			redirect_to @board
		else
			render 'new'
		end
	end

	def update
		@board = Board.find_by(id: params[:id])
		@card = @board.cards.find_by(id: params[:id])
		if @card.update(card_params)
			redirect_to @board
		else
			render 'edit'
		end
	end

	def destroy
		@card = Card.find_by(id: params[:id])
		@card.destroy
		redirect_to @card
	end

private

	def card_params
  		params.require(:card).permit(:title, :description)
	end

end
