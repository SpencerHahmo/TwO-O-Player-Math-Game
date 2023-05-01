class Game

  attr_accessor :order, :player1, :player2

  def initialize
    @order = 1
    @player1 = Player.new
    @player2 = Player.new
  end

  def update_order(order)
    if order == 1
      @order = 2
    else
      @order = 1
    end

    start
  end

  def game_over?
    if player1.loss || player2.loss
      if player1.loss
        puts "Player 2 wins with a score of #{player2.lives}/3"
      else
        puts "Player 1 wins with a score of #{player1.lives}/3"
      end
      puts "----- GAME OVER -----\nGood bye!"
      exit(0)
    end
  end

  def start
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
    question = Question.new(order)
    if !question.start
      if order == 1
        player1.lose_life
      else
        player2.lose_life
      end
    end
    game_over?
    update_order(order)
  end

end