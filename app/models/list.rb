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

end
