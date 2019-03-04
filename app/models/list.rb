class List < ApplicationRecord
  belongs_to :board
  has_many :todos

  def self.list_all(id)
    List.find_by_sql(["
    SELECT *
    FROM lists 
    WHERE lists.board_id = ?
    GROUP BY lists.priority
    ", id
    ])
  end

  def self.single_list(board, id)
      List.find_by_sql(["
      SELECT *
      FROM lists
      WHERE lists.id = ? AND lists.board_id = ?
      ", id, board
    ]).first
  end

  def self.remove_record(id) 
    List.find_by_sql(["
      DELETE FROM lists
      WHERE lists.id = ?
      ", id
    ])
  end

  def self.create_list(params, b_id)
    List.find_by_sql(["
    INSERT INTO lists (name, priority, board_id, created_at, updated_at)
    VALUES (:name, :priority, :board_id, :created_at, :updated_at);
    ", {
      name: params[:name],
      priority: params[:priority],
      board_id: b_id, 
      created_at: DateTime.now,
      updated_at: DateTime.now
    }
    ]).first
  end

  def self.update_list(params, id)
    List.find_by_sql(["
    UPDATE lists
    SET name = ?, priority = ?, updated_at = ?
    WHERE lists.id = ?
    ", params[:name], params[:priority], DateTime.now, id
    ])
  end



end
