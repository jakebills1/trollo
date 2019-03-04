class Todo < ApplicationRecord
  belongs_to :list
  def self.single_todo(list, id)
    Todo.find_by_sql(["
    SELECT *
    FROM todos
    WHERE todos.id = ? AND todos.list_id = ?
    ", id, list
  ]).first
  end

  def self.create_todo(params, list_id)
    Todo.find_by_sql(["
    INSERT INTO todos (desc, list_id, created_at, updated_at)
    VALUES (:desc, :list_id, :created_at, :updated_at);
    ", params[:desc], list_id, DateTime.now, DateTime.now
    ]).first
  end

  def self.update_todo(params, id)
    Todo.find_by_sql(["
      UPDATE todos
      SET desc = ?, complete = ?, updated_at = ?
      WHERE todos.id  = ?
      ", params[:desc], params[:complete], DateTime.now, id
      ]).first
  end



end
