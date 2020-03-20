class TicTacToe

  WIN_COMBINATIONS =[[0,1,2],
                     [3,4,5],
                     [6,7,8],
                     [0,3,6],
                     [1,4,7],
                     [2,5,8],
                     [0,4,8],
                     [6,4,2]]

  def initialize
    @board =[" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string_input)
    string_input.to_i - 1
  end

  def move(idx, char)
    @board[idx] = char
  end

  def position_taken?(idx)
    if @board[idx] == " "
       return false
     else
        return true
     end
   end

   def valid_move?(idx)
     idx.between?(0,8) && !(self.position_taken?(idx))
   end

   def turn_count
      @board.count("X") + @board.count("O")
   end

   def current_player
     (self.turn_count.even?) ? "X" : "O"
   end

   def turn
     input = gets.chomp

     puts input

     index = self.input_to_index(input)
     token = self.current_player

       if self.valid_move?(index)
         self.move(index,token)
         self.display_board
       else
         self.turn
       end
    end

    def won?
      win_combo = nil
      WIN_COMBINATIONS.each do |arr|
        if @board[arr[0]] == @board[arr[1]] &&
           @board[arr[1]] == @board[arr[2]] && position_taken?(arr[0])
             win_combo = arr
        end
      end
      win_combo
    end

    def full?
      @board.all?{ |e| e == "X" || e == "O"}   #!if@board.include(" ")
    end

    def draw?
      !(self.won?) && self.full?
    end

    def over?
      self.won? || self.draw?
    end

    def winner
      @board[self.won?[0]]  if self.won?
    end
end
