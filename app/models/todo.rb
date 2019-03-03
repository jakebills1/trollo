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
end
