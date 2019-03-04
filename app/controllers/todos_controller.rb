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

    if @todo.save
      redirect_to board_path(@list.board_id)
    else
      render :new
    end
  end
    

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to board_path(@list.board_id)
    else
      render :edit
    end
  end


  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def set_todo
      @todo = Todo.single_todo(@list.id, params[:id])
    end

    def todo_params
      params.require(:todo).permit(:desc, :complete, :list_id)
    end
    
    def all_lists
      @lists = current_user.boards.lists.all
    end
end
