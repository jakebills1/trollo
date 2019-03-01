class List < ApplicationRecord
  belongs_to :board

  def self.single_list(board, id)
      List.find_by_sql(["
      SELECT *
      FROM lists
      WHERE lists.id = ? AND lists.board_id = ?
      ", id, board
    ]).first
  end

end
