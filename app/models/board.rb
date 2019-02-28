class Board < ApplicationRecord
  belongs_to :user

  def self.all_boards(u_id)
    Board.find_by_sql(["
      SELECT *
      FROM boards
      WHERE boards.user_id = ?
      ", u_id])
  end

  def self.create_board(params, u_id)
    Board.find_by_sql(["
      INSERT INTO boards (name, user_id, created_at, updated_at)
      VALUES (:name, :user_id, :created_at, :updated_at);
      ", {
        name: params[:name],
        user_id: u_id,
        created_at: DateTime.now,
        updated_at: DateTime.now
      }
    ]).first
  end

  def self.update_board(params, board_id)
    Board.find_by_sql(["
      UPDATE boards
      SET name = ?, updated_at = ?
      WHERE boards_id = ?
      ", params[:name], DateTime.now, board_id
    ])
  end

  def self.single_board(u_id, board_id)
    Board.find_by_sql(["
      SELECT *
      FROM boards
      WHERE boards.id = ? AND boards.user_id = ?
      ", board_id, u_id
    ]).first
  end

end
