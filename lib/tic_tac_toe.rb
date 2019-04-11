class TicTacToe

WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
      ]

  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index (user_input)
      user_input.to_i - 1
    end

    def move (index, player_token = "X")
      @board[index] = player_token
    end

    def position_taken? (position)
      @board[position] == "X" || @board[position] == "O"
    end

    def valid_move? (index)
      index.between?(0, 8) && !position_taken?(index)
    end

    def turn_count
      turn = 0
      @board.each do |index|
        if index == "X" || index == "O"
          turn += 1
        end
      end
      return turn
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
      puts "Please choose a number 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        player_token = current_player
        move(index, player_token)
        display_board
      else
        turn
      end
    end

















end
