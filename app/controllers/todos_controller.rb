class TodosController < ApplicationController
  before_action :set_list
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @todo = @list.todos.new
  end

  def create
    @todo = @list.todos.new(todo_params)

    redirect_to board_path(@list.board_id)
  end
    

  def edit
  end

  def update
    Todo.update_todo(todo_params, @todo)
    redirect_to board_path(@list.board_id)
  end


  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def set_todo
      @todo = Todo.single_todo(@list.id, params[:id])
    end

    def todo_params
      params.require(:todo).permit(:desc, :complete)
    end
end
