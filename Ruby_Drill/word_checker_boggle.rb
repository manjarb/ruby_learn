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

  def include?(word)

    word.upcase!

    @empty_boardArray = []
    @replace_q_array = []
    @word_check_board_array = []

    # all word array
    ###############################
    for i in 0..15 
      @dice_number = @dice_box[i][rand(0..5)]
      # if @dice_number == "Q"
      #    @dice_number = "Qu"
      # end

      @replace_q_array << @dice_number

      if (i + 1) % 4 == 0
        @word_check_board_array << @replace_q_array.join("")
        @replace_q_array = []
      end
    end
    puts "test2"
    puts ""
    print @word_check_board_array.join("\n")
    puts ""

    ################################

    # Horizontal 4 word array
    ################################

    @horizontal_4_word = @word_check_board_array
    puts ""
    print @horizontal_4_word
    puts ""

    ################################

    # Horizontal 3 word front array
    ################################
    @horizontal_3_word_front = []

    @word_check_board_array.each { |x|
        @horizontal_3_word_front << x[0..2]
    }


    print @horizontal_3_word_front
    puts ""

    ################################

    # Horizontal 3 wo`rd after array
    ################################
    @horizontal_3_word_after = []

    @word_check_board_array.each { |x|
        @horizontal_3_word_after << x[1..3]
    }


    print @horizontal_3_word_after
    puts ""

    ################################

    # vertical 4 word array
    ################################
    @vertical_4_word_before = []
    @temp_vertical_4_word_before = ""

    for i in 0..3
      @temp_vertical_4_word_before = ""
      @word_check_board_array.each { |x|
        @temp_vertical_4_word_before << x[i]
      }
      @vertical_4_word_before << @temp_vertical_4_word_before
    end

    print @vertical_4_word_before
    puts ""

    ################################

    # vertical 3 word before array
    ################################
    @vertical_3_word_before = []
    @temp_vertical_3_word_before = ""

    for i in 0..3
      @temp_vertical_3_word_before = ""
      for j in 0..@word_check_board_array.length - 2
          temp_string = @word_check_board_array[j]
          @temp_vertical_3_word_before << temp_string[i]
      end
      @vertical_3_word_before << @temp_vertical_3_word_before
    end

    print @vertical_3_word_before
    puts ""

    ################################
    # vertical 3 word after array
    ################################
    @vertical_3_word_after = []
    @temp_vertical_3_word_after = ""

    for i in 0..3
      @temp_vertical_3_word_after = ""
      for j in 1..@word_check_board_array.length - 1
          temp_string = @word_check_board_array[j]
          @temp_vertical_3_word_after << temp_string[i]
      end
      @vertical_3_word_after << @temp_vertical_3_word_after
    end

    print @vertical_3_word_after
    puts ""

    ################################

    ################################
    # diagonally 4 word before
    ################################
    @diagonally_4_word = []
    @temp_diagonally_4_word = ""

    for i in 0..3
      temp_string = @word_check_board_array[i]
      @temp_diagonally_4_word << temp_string[i]
    end

    @diagonally_4_word << @temp_diagonally_4_word

    print @diagonally_4_word
    puts ""

    ################################

    # diagonally 3 word before array
    ################################
    @diagonally_3_word_before = []
    @temp_diagonally_3_word_before = ""

    for i in 0..2
      temp_string = @word_check_board_array[i]
      @temp_diagonally_3_word_before << temp_string[i]
    end

    @diagonally_3_word_before << @temp_diagonally_3_word_before

    print @diagonally_3_word_before
    puts ""

    ################################

    # diagonally 3 word after
    ################################
    @diagonally_3_word_after = []
    @temp_diagonally_3_word_after = ""

    for i in 1..3
      temp_string = @word_check_board_array[i]
      @temp_diagonally_3_word_after << temp_string[i]
    end

    @diagonally_3_word_after << @temp_diagonally_3_word_after

    print @diagonally_3_word_after
    puts ""

    ################################


    # diagonally 4 word downside
    ################################
    @diagonally_4_word_downside = []
    @temp_diagonally_4_word_downside = ""
    c = 0

    for i in (3).downto(0)
      temp_string = @word_check_board_array[i]
      @temp_diagonally_4_word_downside << temp_string[c]
      c += 1
    end

    @diagonally_4_word_downside << @temp_diagonally_4_word_downside

    print @diagonally_4_word_downside
    puts ""

    ################################

    # diagonally 3 word downside
    ################################
    @diagonally_3_word_downside = []
    @temp_diagonally_3_word_downside = ""
    
    @diagonally_4_word_downside.each { |x|
      for i in 0..2
        @temp_diagonally_3_word_downside << x[i]
      end
      @diagonally_3_word_downside << @temp_diagonally_3_word_downside
      @temp_diagonally_3_word_downside = ""
      for i in 1..3
        @temp_diagonally_3_word_downside << x[i]
      end
      @diagonally_3_word_downside << @temp_diagonally_3_word_downside
      @temp_diagonally_3_word_downside = ""
    }

    print @diagonally_3_word_downside
    puts ""

    ################################

    @whole_word_array = @horizontal_4_word + @horizontal_3_word_front + @horizontal_3_word_after + @vertical_4_word_before + @vertical_3_word_before + @vertical_3_word_after + @diagonally_4_word + @diagonally_3_word_before + @diagonally_3_word_after + @diagonally_4_word_downside + @diagonally_3_word_downside
    print @whole_word_array
    puts ""

    result = false

    @whole_word_array.each { |x|
      #puts "#{word} : #{x}"
      if word == x        
        return true
      end
    }

    return false

  end
end

board = BoggleBoard.new
board.shake!
puts board 
puts ""

board.makeDice
board.dice_shake!
puts board 
puts ""

puts board.include?("cda") == true
puts ""

