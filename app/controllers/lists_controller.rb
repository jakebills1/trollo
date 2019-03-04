class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = @board.list_all(@board.id)
  end

  def show
  end

  def new
    @list = @board.lists.new
    render partial: 'form'
  end

  def create
    List.create_list(list_params, @board.id)
    redirect_to @board
  end

  def edit
    render partial: 'form'
  end

  def update
    List.update_list(list_params, @list)

    redirect_to @board
  end
  
  def destroy
    List.remove_record(@list.id)
    redirect_to @board
  end

  private
    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_list
      @list = List.single_list(@board.id, params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :priority)
    end

end
