class TicTacToe
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
    
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
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end 
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(index)
    if @board[index] == " " or @board[index] == "" or @board[index] == nil 
      return false 
    else
      return true 
    end
  end
  
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8)
      return true 
    else
      return false 
    end 
  end 
  
  def turn_count
    count = 0 
    @board.each do |marker|
      if marker != " "
        count += 1 
      end 
    end
    return count
  end 
  
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else
      return "O" 
    end
  end 
  
  def turn
    puts "Please enter 1-9:"
    index = gets.strip 
    index = input_to_index(index)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end 
  end
  
  def won?
    WIN_COMBINATIONS.detect do |wins|
      @board[wins[0]] == @board[wins[1]] &&
      @board[wins[1]] == @board[wins[2]] &&
      position_taken?(wins[0])
    end
  end
  
  def full?
    @board.all?{|mark| mark == "X"||mark == "O"}
  end 
  
  def draw?
    full? && !won?
  end 
  
  def over?
    draw? or full? or won?
  end 
  
  def winner
    if won?
      return @board [won?[0]]
    end 
  end 
  
  def play
    turn until over?
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  end 