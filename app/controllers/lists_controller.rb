class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def create
    @board = Board.find_by(id: params[:id])
    @list = @board.lists.new(list_params)
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
  params.require(:list).permit(:title)
end

end
