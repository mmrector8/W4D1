require_relative 'tic_tac_toe'



class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    
  end

  def losing_node?(evaluator)
    ##if the board is won 
    ##loop through array of nodes
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  require "byebug"
  def children
    arr = []
    next_mark = (self.next_mover_mark == :x ? :o : :x)
    (0...@board.rows.length).each do |i|
      (0...@board.rows.length).each do |j|
        pos = [i,j]
        if @board.empty?([i,j])
          dup_board = @board.dup
          dup_board[pos] = @next_mover_mark
          arr << TicTacToeNode.new(dup_board, next_mark, pos)

        end
      end
    end
    arr
  end
end
