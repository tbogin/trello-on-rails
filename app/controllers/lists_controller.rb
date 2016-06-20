class ListsController < ApplicationController

  include SessionsHelper

  def new
    @list = List.new
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def create
    @board = Board.find_by(id: params[:list][:board_id])
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to @board
    else
      render 'new'
    end
  end

  def update
    @board = Board.find_by(id: params[:id])
    @list = @board.lists.find_by(id: params[:id])
    if @list.update(list_params)
      redirect_to @board
    else
      render 'edit'
    end
  end

  def destroy
    @board = Board.find_by(id: params[:id])
    @list = @board.lists.find_by(id: params[:id])
    @list.destroy
    redirect_to @board
  end

private

def list_params
  params.require(:list).permit(:title,:board_id)
end

end
