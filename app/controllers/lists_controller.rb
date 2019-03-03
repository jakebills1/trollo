class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = @board.lists
  end

  def show
  end

  def new
    @list = @board.lists.new
    render partial: 'form'
  end

  def create
    @list = @board.lists.new(list_params)

    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
    render partial: 'form'
  end

  def update
    if @list.update
      redirect_to [@board, @list]
    else
      render :edit
    end
  end
  
  def destroy
    @list.remove_record(@list.id)
  end

  private
    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_list
      @list = List.single_list(@board.id, params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end

end
