class BoggleBoard
  def initialize
    @empty_boardArray = Array.new(16,"_")
    @letter_array = ("a".."z").to_a
    @dice_letter = "AAEEGNELRTTYAOOTTWABBJOOEHRTVWCIMOTUDISTTYEIOSSTDELRVYACHOPSHIMNQUEEINSUEEGHNWAFFKPSHLNNRZDEILRX"
    @dice_array = @dice_letter.scan(/.{6}|.+/)
    
  end

  def makeDice
    @dice_box = []
    @dice_array.each { |x|
      @dice_box << x.scan(/.{1}|.+/)
    }
  end
  
  def shake!
    #@empty_boardArray
    @empty_boardArray = []
    for i in 0..15 
      @empty_boardArray << @letter_array.sample
    end
  end

  def dice_shake!
    @empty_boardArray = []
    for i in 0..15 
      @dice_number = @dice_box[i][rand(0..5)]
      @empty_boardArray << @dice_number
    end

  end

  def dice_shake_replace_Q!
    @empty_boardArray = []
    @replace_q_array = []

    for i in 0..15 
      @dice_number = @dice_box[i][rand(0..5)]
      if @dice_number == "Q"
         @dice_number = "Qu"
      end
      @replace_q_array << @dice_number

      if (i + 1) % 4 == 0
        @empty_boardArray << @replace_q_array.join(" ")
        @replace_q_array = []
      end
    end
  end
  
  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  #
  # Override this to print out a sensible board format so
  # you can write code like:
  #
  # board = BoggleBoard.new
  # board.shake!
  # puts board
  def to_s
    #{}"omg what is this? \ntry printing me."
    if @empty_boardArray.length == 16
      return @empty_boardArray.join(" ").upcase.scan(/.{8}|.+/).join("\n")
    else
      return @empty_boardArray.join("\n")
    end

  end
end

board = BoggleBoard.new
puts board 
puts ""

board.shake!
puts board 
puts ""

board.makeDice
board.dice_shake!
puts board 
puts ""

board.makeDice
board.dice_shake_replace_Q!
puts board 
puts ""