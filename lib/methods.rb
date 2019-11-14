# frozen_string_literal: true

class Board
  attr_accessor :game_board, :board_num
  def initialize
    @game_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @board_num = []
  end

  def display_board
    puts "#{@game_board[0]}|#{ @game_board[1]}|#{@game_board[2]}\n"\
     "---------\n"\
     "#{@game_board[3]}|#{@game_board[4]}|#{ @game_board[5]}\n"\
     "---------\n"\
     "#{@game_board[6]}|#{@game_board[7]}|#{@game_board[8]}"
  end

  def add_to_board(choice, player)
    @game_board[choice - 1] = player
  end

  def count_board(player)
    @board_num = []
    9.times do |i|
        if @game_board[i] == player
            @board_num << i
        else
            @board_num << nil
        end
    end
  end

  def winner?
    WIN.any? { |line| (line - @board_num) == [] }
  end
end

class Player
  attr_accessor :choice, :player_one, :player_two
  def initialize
    @choice = nil
    @player_one = "X"
    @player_two = "O"

  end

  def switch
    count = 0
    if (count % 2).zero?
      @player_one
    else
      @player_two
    end
  end

  def num_choice(game_board)
    @choice = gets.to_i
    until (game_board[@choice - 1] == " ") && @choice.between?(1, 9)
      puts "\nERROR: Number needs to be between 1-9 and not used already...\n"
      puts "Please input another number.\n\n"
      @choice = gets.to_i
    end
    @choice
  end
end
