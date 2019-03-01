class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :set_board
  def index

  end

  def show
  end

  def new
  end

  def edit
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.single_list()
  end

end
