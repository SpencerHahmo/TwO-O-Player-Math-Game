class Question

  attr_reader :order

  def initialize(order)
    @order = order
  end

  def start
    num1 = rand(1..20)
    num2 = rand(1..20)

    puts "----- NEW TURN -----"
    puts "Player #{order}: What does #{num1} plus #{num2} equal?"
    print "> "

    answer = $stdin.gets.chomp.to_i

    if answer == num1 + num2
      puts "Player #{order}: YES! You are correct."
      return true
    else
      puts "Player #{order}: Seriously? No!"
      return false
    end
  end
end