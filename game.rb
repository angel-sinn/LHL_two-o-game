class Game 

  def initialize()
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @current_player = @player_1
  end

  def game_intro
    puts "========================================"
    puts " *** Welcome to the Ruby Math Game *** "
    puts "========================================"
  end

  def ask_question(current_player)
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    puts "#{@current_player.name}: What does #{@num1} plus #{@num2} equal?"
  end

  def verify_answer(input)
    input == (@num1 + @num2) 
  end

  def show_score
      puts "Stats - P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
  end

  def switch_player(current_player)
    if current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def declare_winner
    if @player_1.lives > @player_2.lives
      puts "=============================================="
      puts "*** Player 1 wins with #{@player_1.lives}/3 lives remaining ***"
      puts "=============================================="
    else
      puts "=============================================="
      puts "*** Player 2 wins with #{@player_2.lives}/3 lives remaining ***"
      puts "=============================================="
    end
  end

  def start
  game_intro
    while @player_1.lives > 0 && @player_2.lives > 0 do
      puts "--------------- New Turn ---------------"
      puts "#{@current_player.name}'s turn!"
      ask_question(@current_player)
      print "> "
      input = gets.chomp().to_i

      if verify_answer(input)
        puts "YES! You are correct!"
        show_score
      else 
        puts "Seriously? No!"
        @current_player.lose_life
        show_score
        switch_player(@current_player)
      end
    end
    declare_winner
  end
end
    
