class Game 

  def initialize()
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @current_player = @player_1.name
  end

  def ask_question(current_player)
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    puts "#{@current_player}: What does #{@num1} plus #{@num2} equal?"
  end

  def verify_answer(input)
    input == (@num1 + @num2) 
  end

  def show_score
      puts "Current Stats - #{@player_1.name}: #{@player_1.lives}/3 vs #{@player_2.name}: #{@player_2.lives}/3"
  end

  def start
    puts "----New Game----"
    show_score
    puts "#{@current_player} will go first!"
    ask_question(@current_player)
    print "> "
    input = gets.chomp().to_i
    if verify_answer(input)
      puts "YES! You are correct"
    else 
      puts "Seriously? No!"
      @current_player.lose_life
    end
  end




end
    
